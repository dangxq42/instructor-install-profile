<?php

/**
 * @file
 * Enables modules and site configuration for a instructor site installation.
 */

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function instructor_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

/**
 * Implements hook_install_tasks_alter().
 */
function instructor_install_tasks_alter(&$tasks, $install_state) {
  $tasks['install_select_locale']['function'] = '_instructor_locale_selection';
}

/**
 * Set default language to English.
 *
 * Allows for installer to skip the "Select a language" page.
 */
function _instructor_locale_selection(&$install_state) {
  $install_state['parameters']['locale'] = 'en';
}
