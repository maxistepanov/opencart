<?php
class ControllerExtensionModulePopup extends Controller {
	public function index() {

		$this->load->language('extension/module/popup');

		$this->document->addStyle('catalog/view/javascript/popup/popup.css');
		$this->document->addScript('catalog/view/javascript/popup/js.cookie.js');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_welcome'] = $this->language->get('text_welcome');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_subcribe'] = $this->language->get('text_subcribe');

		$data['popup_show'] = $this->config->get('popup_show');
		$data['popup_status'] = $this->config->get('popup_status');
		$data['popup_time_after_show_popup'] = $this->config->get('popup_time_after_show_popup');

		return $this->load->view('extension/module/popup', $data);
	}
}