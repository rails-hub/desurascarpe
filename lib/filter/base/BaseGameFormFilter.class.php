<?php

/**
 * Game filter form base class.
 *
 * @package    scraper
 * @subpackage filter
 * @author     Your name here
 */
abstract class BaseGameFormFilter extends BaseFormFilterPropel
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'         => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'image'        => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'price'        => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'developer_id' => new sfWidgetFormPropelChoice(array('model' => 'Developer', 'add_empty' => true)),
      'game_id'      => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'game_name'    => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'created_at'   => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
      'updated_at'   => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
    ));

    $this->setValidators(array(
      'name'         => new sfValidatorPass(array('required' => false)),
      'image'        => new sfValidatorPass(array('required' => false)),
      'price'        => new sfValidatorPass(array('required' => false)),
      'developer_id' => new sfValidatorPropelChoice(array('required' => false, 'model' => 'Developer', 'column' => 'id')),
      'game_id'      => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'game_name'    => new sfValidatorPass(array('required' => false)),
      'created_at'   => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDate(array('required' => false)), 'to_date' => new sfValidatorDate(array('required' => false)))),
      'updated_at'   => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDate(array('required' => false)), 'to_date' => new sfValidatorDate(array('required' => false)))),
    ));

    $this->widgetSchema->setNameFormat('game_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    parent::setup();
  }

  public function getModelName()
  {
    return 'Game';
  }

  public function getFields()
  {
    return array(
      'id'           => 'Number',
      'name'         => 'Text',
      'image'        => 'Text',
      'price'        => 'Text',
      'developer_id' => 'ForeignKey',
      'game_id'      => 'Number',
      'game_name'    => 'Text',
      'created_at'   => 'Date',
      'updated_at'   => 'Date',
    );
  }
}
