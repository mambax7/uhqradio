<{if $block.error}>
    <{$block.error}>
<{else}>
    <{if $block.dj.name}>
        <div style="text-align: center;">
            <{if $block.dj.urlpic}>
                <img src="<{$block.dj.urlpic}>" title="<{$block.dj.name}>" class="albumcover">
            <{else}>
                <img src="<{$smarty.const._MB_UHQRADIO_ONAIR_NODJPIC}>"
                     title="<{$smarty.const._MB_UHQRADIO_ONAIR_NODJPIC_TXT}>">
            <{/if}>
        </div>
        <hr>
        <{$smarty.const._MB_UHQRADIO_ONAIR_DJHDR}><a
        href="/modules/uhqradio/djprofile.php?djid=<{$block.dj.djid}>"><{$block.dj.name}></a>
        <{if $block.showname}><br><{$smarty.const._MB_UHQRADIO_ONAIR_SHOWHDR}><{$block.showname}><{/if}>
    <{elseif $block.djid}>
        <{$smarty.const._MB_UHQRADIO_ONAIR_DJID}><{$block.djid}><{$smarty.const._MB_UHQRADIO_ONAIR_DJDBERR}>
    <{/if}>
<{/if}>
