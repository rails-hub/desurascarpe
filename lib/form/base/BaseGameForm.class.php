<?php

/**
 * Game form base class.
 *
 * @method Game getObject() Returns the current form's model object
 *
 * @package    scraper
 * @subpackage form
 * @author     Your name here
 */
abstract class BaseGameForm extends BaseFormPropel
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'           => new sfWidgetFormInputHidden(),
      'name'         => new sfWidgetFormInputText(),
      'image'        => new sfWidgetFormInputText(),
      'price'        => new sfWidgetFormInputText(),
      'developer_id' => new sfWidgetFormPropelChoice(array('model' => 'Developer', 'add_empty' => false)),
      'game_id'      => new sfWidgetFormInputText(),
      'game_name'    => new sfWidgetFormInputText(),
      'created_at'   => new sfWidgetFormDateTime(),
      'updated_at'   => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'           => new sfValidatorChoice(array('choices' => array($this->getObject()->getId()), 'empty_value' => $this->getObject()->getId(), 'required' => false)),
      'name'         => new sfValidatorString(array('max_length' => 255)),
      'image'        => new sfValidatorString(array('max_length' => 255)),
      'price'        => new sfValidatorString(array('max_length' => 255)),
      'developer_id' => new sfValidatorPropelChoice(array('model' => 'Developer', 'column' => 'id')),
      'game_id'      => new sfValidatorInteger(array('min' => -2147483648, 'max' => 2147483647)),
      'game_name'    => new sfValidatorString(array('max_length' => 255)),
      'created_at'   => new sfValidatorDateTime(array('required' => false)),
      'updated_at'   => new sfValidatorDateTime(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('game[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    parent::setup();
  }

  public function getModelName()
  {
    return 'Game';
  }


}
