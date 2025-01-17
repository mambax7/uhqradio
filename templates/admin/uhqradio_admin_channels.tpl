<{if $error|default:''}>
    <span style="color:red;"><{$smarty.const._AM_UHQRADIO_SQLERR}></span>
    : <{$error}>

<{elseif $data|default:''}>
    <hr>
    <table>
        <tr>
            <th><{$smarty.const._AM_UHQRADIO_LIST_CHANNAME}></th>
            <th><{$smarty.const._AM_UHQRADIO_LIST_CMAP}></th>
            <th><{$smarty.const._AM_UHQRADIO_LIST_ACT}></th>
        </tr>
        <{foreach item=list from=$data}>
            <tr class="<{cycle values=" odd,even"}>">
                <td>
                    <{$list.chan_name}> - <{$list.chan_tag}>
                </td>
                <td>
                    <{if $list.map}>
                        <ul>
                            <{foreach item=map from=$list.map}>
                                <li><{$map.server}>:<{$map.port}><{$map.mount}> -
                                    <a href='channels.php?op=delch&chid=<{$list.chid}>&mpid=<{$map.mpid}>'>
                                        <{$smarty.const._AM_UHQRADIO_LIST_ACT_DELMAP}></a>
                                </li>
                            <{/foreach}>
                        </ul>
                    <{/if}>
                </td>
                <td>
                    <a href='channels.php?op=edit&chid=<{$list.chid}>'><{$smarty.const._AM_UHQRADIO_LIST_ACT_EDIT}></a>
                    -
                    <a href='channels.php?op=delete&chid=<{$list.chid}>'><{$smarty.const._AM_UHQRADIO_LIST_ACT_DEL}></a>
                    -
                    <a href='channels.php?op=addch&chid=<{$list.chid}>'><{$smarty.const._AM_UHQRADIO_LIST_ACT_ADDCH}></a>
                </td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>

<hr><a href='channels.php?op=insert'><{$smarty.const._AM_UHQRADIO_ADDCHANNEL}></a>
