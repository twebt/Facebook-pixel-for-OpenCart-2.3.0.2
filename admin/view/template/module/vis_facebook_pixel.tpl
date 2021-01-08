<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-vis-fb-pixel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>

            <h1><?php echo $heading_title_main; ?></h1>

            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-vis-fb-pixel" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <?php if ($vis_facebook_pixel_status) { ?>
                            <input data-toggle="toggle" data-size="small" type="checkbox" name="vis_facebook_pixel_status" value="1" checked="checked">
                            <?php } else { ?>
                            <input data-toggle="toggle" data-size="small" type="checkbox" name="vis_facebook_pixel_status" value="">
                            <?php } ?>
                        </div>
                    </div>

                    <br>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="vis_facebook_pixel_pixel_id"><span data-toggle="tooltip" title='Login to your <a href=\"https://www.facebook.com/ads/manager/pixel/facebook_pixel/\" target=\"_blank\"><u>Facebook Ads Management</u></a> account and select the Pixel ID, in the upper right corner. Paste the Pixel ID into this field.'>Facebook Pixel ID</label>
                            <div class="col-sm-10" id="vis_facebook_pixel_pixel_id">
                                <input type="text" class="form-control" name="vis_facebook_pixel_pixel_id" value="<?php echo $vis_facebook_pixel_pixel_id; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="vis_facebook_pixel_catalog_id"><span data-toggle="tooltip" title='The Product Catalog ID is required for Dynamic Product Ads'>Facebook Catalog ID</label>
                                <div class="col-sm-10" id="vis_facebook_pixel_catalog_id">
                                    <input type="text" class="form-control" name="vis_facebook_pixel_catalog_id" value="<?php echo $vis_facebook_pixel_catalog_id; ?>">
                                </div>
                        </div>

                        <div class="form-group">
                            <label for="vis_facebook_events" class="col-sm-2 control-label"><b>Pixel Events</b></label>
                            <div class="col-sm-10" id="vis_facebook_events">

                                <div class="col-sm-2"> 
                                    <label class="label-event">Page View</label>
                                    <input data-toggle="toggle" data-size="mini" type="checkbox" name="vis_facebook_pixel_events[page-view]" value="<?php echo isset($vis_facebook_pixel_events['page-view']) ? $vis_facebook_pixel_events['page-view'] : ''?>" <?php echo isset($vis_facebook_pixel_events['page-view']) ? 'checked="checked"' : ''?>>
                                </div>
                                <div class="col-sm-2">
                                    <label class="label-event" for="">View Content </label>
                                    <input data-toggle="toggle" data-size="mini" type="checkbox" name="vis_facebook_pixel_events[view-content]" value="<?php echo isset($vis_facebook_pixel_events['view-content']) ? $vis_facebook_pixel_events['view-content'] : '' ?>" <?php echo isset($vis_facebook_pixel_events['view-content']) ? 'checked="checked"' : ''?>>
                                </div>
                                <div class="col-sm-2">
                                    <label class="label-event" for="">Add to Cart</label>
                                    <input data-toggle="toggle" data-size="mini" type="checkbox" name="vis_facebook_pixel_events[add-to-cart]" value="<?php echo isset($vis_facebook_pixel_events['add-to-cart']) ? $vis_facebook_pixel_events['add-to-cart'] : ''?>" <?php echo isset($vis_facebook_pixel_events['add-to-cart']) ? 'checked="checked"' : ''?>>
                                </div>
                                <div class="col-sm-2">
                                    <label class="label-event" for="">Initiate Checkout</label>
                                    <input data-toggle="toggle" data-size="mini" type="checkbox" name="vis_facebook_pixel_events[initiate-checkout]" value="<?php echo isset($vis_facebook_pixel_events['initiate-checkout']) ? $vis_facebook_pixel_events['initiate-checkout'] : '' ?>" <?php echo isset($vis_facebook_pixel_events['initiate-checkout']) ? 'checked="checked"' : ''?>>
                                </div>
                                <div class="col-sm-2">
                                    <label class="label-event" for="">Purchase</label>
                                    <input data-toggle="toggle" data-size="mini" type="checkbox" name="vis_facebook_pixel_events[purchase]" value="<?php echo isset($vis_facebook_pixel_events['purchase']) ? $vis_facebook_pixel_events['purchase'] : ''?>" <?php echo isset($vis_facebook_pixel_events['purchase']) ? 'checked="checked"' : ''?>>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function() {
            $("[data-toggle='toggle']").bootstrapSwitch();
            $("[data-toggle='toggle']").on('switchChange.bootstrapSwitch', function(event, state) {
                if ($(this).is(':checked')) {
                    $(this).val(1);
                } else {
                    $(this).val(0);
                }
            });
        });
    </script>
<?php echo $footer; ?>