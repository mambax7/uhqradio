<div style="text-align: center;">
    <{if $block.stop}>
        <a href="/modules/uhqradio/control.php?op=stop">
            <img src="<{$smarty.const._MB_UHQRADIO_STOPIMG}>" title="<{$smarty.const._MB_UHQRADIO_STOPTXT}>">
        </a>
    <{/if}>
    <{if $block.start}>
        <a href="/modules/uhqradio/control.php?op=start">
            <img src="<{$smarty.const._MB_UHQRADIO_STARTIMG}>" title="<{$smarty.const._MB_UHQRADIO_STARTTXT}>">
        </a>
    <{/if}>
    <{if $block.rewind}>
        <a href="/modules/uhqradio/control.php?op=rewind">
            <img src="<{$smarty.const._MB_UHQRADIO_REWIMG}>" title="<{$smarty.const._MB_UHQRADIO_REWTXT}>">
        </a>
    <{/if}>
    <{if $block.skip}>
        <a href="/modules/uhqradio/control.php?op=skip">
            <img src="<{$smarty.const._MB_UHQRADIO_SKIPIMG}>" title="<{$smarty.const._MB_UHQRADIO_SKIPTXT}>">
        </a>
    <{/if}>
    <{if $block.stopnow}>
        <a href="/modules/uhqradio/control.php?op=stopnow">
            <img src="<{$smarty.const._MB_UHQRADIO_STOPNOWIMG}>" title="<{$smarty.const._MB_UHQRADIO_STOPNOWTXT}>">
        </a>
    <{/if}>

</div>
