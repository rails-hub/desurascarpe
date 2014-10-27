<?php

/**
 * Avatar form base class.
 *
 * @method Avatar getObject() Returns the current form's model object
 *
 * @package    scraper
 * @subpackage form
 * @author     Your name here
 */
abstract class BaseAvatarForm extends BaseFormPropel
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'         => new sfWidgetFormInputHidden(),
      'name'       => new sfWidgetFormInputText(),
      'image'      => new sfWidgetFormInputText(),
      'game_id'    => new sfWidgetFormPropelChoice(array('model' => 'Game', 'add_empty' => false)),
      'created_at' => new sfWidgetFormDateTime(),
      'updated_at' => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'         => new sfValidatorChoice(array('choices' => array($this->getObject()->getId()), 'empty_value' => $this->getObject()->getId(), 'required' => false)),
      'name'       => new sfValidatorString(array('max_length' => 255)),
      'image'      => new sfValidatorString(array('max_length' => 255)),
      'game_id'    => new sfValidatorPropelChoice(array('model' => 'Game', 'column' => 'id')),
      'created_at' => new sfValidatorDateTime(array('required' => false)),
      'updated_at' => new sfValidatorDateTime(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('avatar[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    parent::setup();
  }

  public function getModelName()
  {
    return 'Avatar';
  }


}
