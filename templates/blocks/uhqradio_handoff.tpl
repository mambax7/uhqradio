<{if $block.error}>
    Error: <{$block.error}>
<{else}>

    <{if $block.ondeck}>
        <{$block.ondeck}> on-deck<{if $block.status}> and <{$block.status}><{/if}>.
    <{else}>
        Handoff will go to the autoplayer.
    <{/if}>
    <{if $block.surrender}>
        <hr>
        <a href="/modules/uhqradio/handoff.php?op=surrender">Surrender</a>
        Handoff.
    <{else}>

        <{if $block.status}>
        <{else}>
            <hr>
            <a href="/modules/uhqradio/handoff.php?op=request">Request</a>
            Handoff.
        <{/if}>

    <{/if}>

<{/if}>
