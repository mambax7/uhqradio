<?php

include __DIR__ . '/../../mainfile.php';
require_once XOOPS_ROOT_PATH . '/modules/uhqradio/include/sanity.php';
require_once XOOPS_ROOT_PATH . '/modules/uhqradio/include/functions.php';
require_once XOOPS_ROOT_PATH . '/modules/uhqradio/include/rawdata.php';
require_once XOOPS_ROOT_PATH . '/modules/uhqradio/include/modoptions.php';
require_once XOOPS_ROOT_PATH . '/modules/uhqradio/include/sambc.php';

// Load Templates & Smarty

require_once XOOPS_ROOT_PATH . '/class/template.php';
if (!isset($xoopsTpl)) {
    $xoopsTpl = new XoopsTpl();
}

$sanerequest = uhqradio_dosanity();

// Header

include XOOPS_ROOT_PATH . '/header.php';

// Song Information Data

$data = [];

/**
 * @param $songid
 * @return array
 */
function uhqradio_playlist_dosonginfo($songid)
{
    global $xoopsDB;
    global $samdb;

    $block = [];

    // Return a blank block if SAM Integration isn't enabled.
    if (false === uhqradio_samint()) {
        $block['samint'] = 0;

        return $block;
    }
    $block['samint'] = 1;

    // Find DJ

    $info = uhqradio_dj_onair(1);

    if (false === $info) {
        $block['error'] = _MB_UHQRADIO_ERROR . $xoopsDB->error();

        return $block;
    }

    if (0 == $info['djip']) {
        $block['error'] = 'No Source IP Found';

        return $block;
    }

    // Open Remote Database

    $samdb = uhqradio_sam_opendb($info['djid'], $info['djip']);
    if (false === $samdb) {
        $block['error'] = 'Unable to contact DB ' . $info['djid'] . ' at ' . $info['djip'];

        return $block;
    }

    // Get Song Information

    $block['songinfo'] = uhqradio_sam_songinfo($samdb, $songid);
    $block['djid']     = $info['djid'];
    $block['baseurl']  = uhqradio_opt_albumurl();

    // Close Database

    uhqradio_sam_closedb($samdb);

    return $block;
}

// Initialize start/limit if they aren't passed in the URL.

$data            = uhqradio_playlist_dosonginfo($sanerequest['songid']);
$data['showreq'] = $uhqradio_request;

$xoopsTpl->assign('data', $data);

// Render Template

$xoopsTpl->display('db:pop/uhqradio_pop_songinfo.tpl');
