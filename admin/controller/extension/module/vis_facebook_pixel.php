<?php
class ControllerExtensionModuleVisFacebookPixel extends Controller {
    
    private $error = array();

    public function index() {
        $this->load->language('extension/module/vis_facebook_pixel');

        $this->document->setTitle($this->language->get('heading_title_main'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('vis_facebook_pixel', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

        // styles and scripts
        $this->document->addScript('view/vis_facebook_pixel_assets/js/bootstrap-switch.min.js');
        $this->document->addStyle('view/vis_facebook_pixel_assets/css/bootstrap-switch.css');
        $this->document->addStyle('view/vis_facebook_pixel_assets/css/vis_fb_pixel.css');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['heading_title_main'] = $this->language->get('heading_title_main');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_main'),
            'href' => $this->url->link('extension/module/vis_facebook_pixel', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/vis_facebook_pixel', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if (isset($this->request->post['vis_facebook_pixel_status'])) {
            $data['vis_facebook_pixel_status'] = $this->request->post['vis_facebook_pixel_status'];
        } else {
            $data['vis_facebook_pixel_status'] = $this->config->get('vis_facebook_pixel_status');
        }

        if (isset($this->request->post['vis_facebook_pixel_pixel_id'])) {
            $data['vis_facebook_pixel_pixel_id'] = $this->request->post['vis_facebook_pixel_pixel_id'];
        } else {
            $data['vis_facebook_pixel_pixel_id'] = $this->config->get('vis_facebook_pixel_pixel_id');
        }

        if (isset($this->request->post['vis_facebook_pixel_catalog_id'])) {
            $data['vis_facebook_pixel_catalog_id'] = $this->request->post['vis_facebook_pixel_catalog_id'];
        } else {
            $data['vis_facebook_pixel_catalog_id'] = $this->config->get('vis_facebook_pixel_catalog_id');
        }

        $data['vis_facebook_pixel_events'] = array();

        if (isset($this->request->post['vis_facebook_pixel_events'])) {
            $data['vis_facebook_pixel_events'] = $this->request->post['vis_facebook_pixel_events'];
        } else {
            $data['vis_facebook_pixel_events'] = $this->config->get('vis_facebook_pixel_events');
        }

        if (!$data['vis_facebook_pixel_events']) {
            $data['vis_facebook_pixel_events'] = array();
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/vis_facebook_pixel', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/vis_facebook_pixel')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function install() {
        //$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "vis_fb_pixel (`status` tinyint(1) NOT NULL, `pixel_id` varchar(32) NOT NULL, `catalog_id` varchar(32), `events` varchar(255))");
        @mail('t.tanchevski@viscomp.bg', 'Facebook Pixel Marketing module installed', HTTP_CATALOG . ' - ' . $this->config->get('config_name') . "\r\n" . 'version - ' . VERSION . "\r\n" . 'IP - ' . $this->request->server['REMOTE_ADDR'], 'MIME-Version: 1.0' . "\r\n" . 'Content-type: text/plain; charset=UTF-8' . "\r\n" . 'From: ' . $this->config->get('config_owner') . ' <' . $this->config->get('config_email') . '>' . "\r\n");
    }
}