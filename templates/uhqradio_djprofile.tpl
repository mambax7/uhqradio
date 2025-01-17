<{if $error|default:''}>
    <span style="color:red;"><{$smarty.const._MD_UHQRADIO_DJPROFILE_ERR}></span>
    : <{$error}>

<{elseif $data|default:''}>

    <{if $data.djname}>
        <{if $data.urlpic}>
            <img src=<{$data.urlpic}>>
        <{/if}>
        <h3><{$smarty.const._MD_UHQRADIO_DJPROFILE_HDR}> :: <{$data.djname}></h3>
        <hr>
        <table>
            <{if $data.urlsite}>
                <tr class=even>
                    <td><{$smarty.const._MD_UHQRADIO_DJPROFILE_WEB}></td>
                    <td><a href="<{$data.urlsite}>"><{$data.urlsite}></a></td>
                </tr>
            <{/if}>
            <{if $data.play_ga}>
                <tr class=even>
                    <td><{$smarty.const._MD_UHQRADIO_DJPROFILE_PLAYGA}></td>
                    <td><{$data.play_ga}></td>
                </tr>
            <{/if}>
            <{if $data.play_mu}>
                <tr class=even>
                    <td><{$smarty.const._MD_UHQRADIO_DJPROFILE_PLAYMU}></td>
                    <td><{$data.play_mu}></td>
                </tr>
            <{/if}>
            <tr class=foot>
                <td colspan=2>
                    <{if $data.flag_req == 1}>
                        <{$smarty.const._MD_UHQRADIO_DJPROFILE_REQ_OK}>
                    <{else}>
                        <{$smarty.const._MD_UHQRADIO_DJPROFILE_REQ_NOK}>
                    <{/if}>
                </td>
            </tr>
        </table>
        <{if $data.blurb}>
            <hr>
            <table class=odd>
                <td><{$data.blurb}></td>
            </table>
        <{/if}>
        <{if $data.isuser}>
            <hr>
            <a href="/modules/uhqradio/sm-djprofile.php?djid=<{$data.djid}>&op=edit"><{$smarty.const._MD_UHQRADIO_DJPROFILE_EYI}></a>
        <{/if}>
    <{elseif $data.djcount}>
        <table class="djlist">
            <tr>
                <th width=1%>#</th>
                <th><{$smarty.const._MD_UHQRADIO_DJPROFILE_HDR}></th>
            </tr>
            <{foreach item=list from=$data.djs key=key}>
                <tr>
                    <td><{$key+1}></td>
                    <td><a href="/modules/uhqradio/sm-djprofile.php?djid=<{$list.djid}>"><{$list.name}></a></td>
                </tr>
            <{/foreach}>
        </table>
    <{else}>
        <{$smarty.const._MD_UHQRADIO_DJPROFILE_NOLIST}>
    <{/if}>

<{/if}>
