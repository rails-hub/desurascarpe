<?php

namespace Scrapper\ScrapeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Propel\Runtime\Propel;
use Symfony\Component\DomCrawler\Crawler;

require_once '../src/Erivello/SimpleHtmlDomBundle/lib/simple_html_dom.php';

class DefaultController extends Controller
{
    public function indexAction()
    {
        try {
            $url = file_get_contents("http://www.desura.com/games/ajax/json/all");
            $this->desuraExtractAction(json_decode($url));

        } catch (Exception $e) {
            echo "Something went wrong";
        }
        return $this->render('ScrapperScrapeBundle:Default:index.html.twig', array('name' => "url"));
    }


    public function desuraExtractAction($url)
    {
        $conn = $this->get('database_connection');
        date_default_timezone_set("UTC");
        if ($url->success) {
            foreach ($url->games as $game) {
                $dTime = date("Y-m-d H:i:s", time());
                // parse to get developer info
                $parser = $this->container->get('simple_html_dom');
                $game_url = "http://www.desura.com/games/" . $game[2];
                $html = $parser->file_get_html($game_url);
                foreach ($html->find('.info > div.row') as $item) {
                    if ($item->children(0)->plaintext == "Developer") {
                        $dev = $item->children(1)->plaintext;
                        $already = $conn->executeQuery("SELECT * FROM developer where developer.name = '$dev' ")->fetchAll();
                        $errors = array_filter($already);
                        if (empty($errors)) {
                            $developer = $conn->executeQuery("INSERT INTO developer (developer.name, developer.created_at, developer.updated_at)VALUES ('$dev','$dTime','$dTime');");
                            $already = $conn->executeQuery("SELECT * FROM developer where developer.name = '$dev' ")->fetchAll();
                        }
                    }
                }

                $ht = (string)$html;
                $str = "$ht";
                $from = 'var slidearr';
                $to = 'galleryBrowse';

                echo $this->getStringBetween($str, $from, $to);


                $img = "http://media.desura.com/cache/images/games/$game[8]";
                $dId = $already[0]['id'];
                $game_already = $conn->executeQuery("SELECT * FROM game where game.game_name = '$game[2]' AND game.game_id = '$game[0]' AND game.price = '$game[14]' ")->fetchAll();
                $err = array_filter($game_already);
                if (empty($err)) {
                    $create_game = $conn->executeQuery("INSERT INTO game (game.name,game.price,game.image, game.developer_id, game.game_id, game.game_name, game.created_at, game.updated_at)
                        VALUES ('$game[1]','$game[14]','$img',$dId,'$game[0]' ,'$game[2]','$dTime','$dTime');");
                    $game_already = $conn->executeQuery("SELECT * FROM game where game.game_name = '$game[2]' AND game.game_id = '$game[0]' AND game.price = '$game[14]' ")->fetchAll();
                }

                // Scrap Images
                $dir = "../uploads/$game[2]";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                $image_url = "http://rss.desura.com/games/$game[2]/images/feed/rss.xml";
                $images = simplexml_load_file($image_url);
                foreach ($images as $entry) {
                    $gId = $game_already[0]['id'];
                    foreach ($entry->item as $item) {
                        $img = $item->enclosure["url"];
                        $find_image = $conn->executeQuery("SELECT * FROM avatar where avatar.image = '$img' AND avatar.game_id = $gId ")->fetchAll();
                        $er = array_filter($find_image);
                        if (empty($er)) {
                            $dateTime = date("Y-m-d H:i:s", time());
                            $create_avatar = $conn->executeQuery("INSERT INTO avatar (avatar.name, avatar.image , avatar.game_id, avatar.created_at, avatar.updated_at)
                                                    VALUES ('file_{$dateTime}.jpeg','$img', $gId,'$dateTime','$dateTime');");
                            copy("$img", "$dir/file_{$dateTime}.jpeg");
                        }
                    }
                }

                // Scrap Videos
                $video_url = "http://rss.desura.com/games/$game[2]/videos/feed/rss.xml";
                $videos = simplexml_load_file($video_url);
                foreach ($videos as $entry) {
                    $gId = $game_already[0]['id'];
                    foreach ($entry->item as $item) {
                        $vid = $item->enclosure["url"];
                        $find_video = $conn->executeQuery("SELECT * FROM video where video.link = '$vid' AND video.game_id = $gId ")->fetchAll();
                        $eer = array_filter($find_video);
                        if (empty($eer)) {
                            $datTime = date("Y-m-d H:i:s", time());
                            $create_avatar = $conn->executeQuery("INSERT INTO video (video.name, video.link , video.game_id, video.created_at, video.updated_at)
                                                    VALUES ('file_{$datTime}.mov.mp4','$vid', $gId,'$datTime','$datTime');");
                        }
                    }
                }
                sasdsadasdasd;
            }
            // take dump
            $dt = date("Y-m-d H:i:s", time());
            $str = str_replace(":", " ", $dt);
            exec("mysqldump --user=root --password=root --host=127.0.0.1 scraper > ../db_dump/desura_db_'{$str}'.sql");


            // upload file to FTP server
            $ftp_server = 'test.test.com';
            $ftp_user_name = 'test';
            $ftp_user_pass = 'test';
            $file = "../db_dump/desura_db_'{$str}'.sql";
            $remote_file = "'desura_db_'{$str}'.sql'";

            // set up basic connection
            $conn_id = ftp_connect($ftp_server);

            // login with username and password
            $login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);

            // upload a file
            if (ftp_put($conn_id, $remote_file, $file, FTP_ASCII)) {
                echo "successfully uploaded $file\n";
            } else {
                echo "There was a problem while uploading $file\n";
            }

            // close the connection
            ftp_close($conn_id);
        }

    }


    protected
    function rrmdir($dir)
    {
        foreach (glob($dir . '/*') as $file) {
            if (is_dir($file)) $this->rrmdir($file); else unlink($file);
        }
        if ($dir != "uploads/") {
            rmdir($dir);
        }
    }


    function getStringBetween($str, $from, $to)
    {
        $sub = substr($str, strpos($str, $from) + strlen($from), strlen($str));
        return substr($sub, 0, strpos($sub, $to));
    }
}
