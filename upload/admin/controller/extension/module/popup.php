<?php
class ControllerExtensionModulePopup extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/popup');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('popup', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_yes']                = $this->language->get('text_yes');
		$data['text_no']                 = $this->language->get('text_no');
		$data['text_always']             = $this->language->get('text_always');
		$data['text_once']               = $this->language->get('text_once');
		$data['text_light']              = $this->language->get('text_light');
		$data['text_dark']               = $this->language->get('text_dark');
		$data['text_enabled']            = $this->language->get('text_enabled');
		$data['text_disabled']           = $this->language->get('text_disabled');
		$data['text_content_top']        = $this->language->get('text_content_top');
		$data['text_content_bottom']     = $this->language->get('text_content_bottom');
		$data['text_column_left']        = $this->language->get('text_column_left');
		$data['text_column_right']       = $this->language->get('text_column_right');;
		$data['text_edit']               = $this->language->get('text_edit');

		$data['newsletter_status']                = $this->language->get('newsletter_status');
		$data['newsletter_show']                  = $this->language->get('newsletter_show');
		$data['newsletter_time_after_show_popup'] = $this->language->get('newsletter_time_after_show_popup');

		$data['button_save']   = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
		);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/popup', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/popup', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['popup_show'])) {
			$data['popup_show'] = $this->request->post['popup_show'];
		} else {
			$popup_show         = $this->config->get('popup_show');
			$data['popup_show'] = !empty($popup_show) ? $popup_show : "always";
		}

		if (isset($this->request->post['popup_time_after_show_popup'])) {
			$data['popup_time_after_show_popup'] = $this->request->post['newsletter_time_after_show_popup'];
		} else {
			$popup_time_after_show_popup         = $this->config->get('popup_time_after_show_popup');
			$data['popup_time_after_show_popup'] = !empty($popup_time_after_show_popup) ? $popup_time_after_show_popup : 1;
		}

		if (isset($this->request->post['filter_status'])) {
	      $data['popup_status'] = $this->request->post['popup_status'];
	    } else {
	      $data['popup_status'] = $this->config->get('popup_status');
	    }

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/popup.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/popup')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

}