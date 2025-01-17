<html>
<head>
    <title>Song Information</title>
    <{if $xoops_themecss}>
        <link rel="stylesheet" type="text/css" media="all" title="Style sheet" href="<{$xoops_themecss}>">
    <{/if}>
</head>
<script type="text/javascript">
    function request(songid) {
        win_request = window.open("pop_request.php?songid=" + songid, "songinfowin", "location=no,status=no,menubar=no,scrollbars=yes,resizeable=yes,height=300,width=650");
    }
    function uhq_nocover(source) {
        source.src = "/modules/uhqradio/images/nocover.png";
        // disable onerror to prevent endless loop
        source.onerror = "";
        return true;
    }
</script>
<body id="uhq_radio_songinfo">
<style type="text/css">
    table {
        width: 100%;
    }

    th {
        text-align: left;
    }

    td {
        vertical-align: top;
    }

    .album {
        width: 168px;
    }

    .albumcover {
        width: 160px;
        height: auto;
    }

    .category {
        width: 1px;
    }

    .lastplay {
        text-align: right;
        font-size: small;
        font-style: italic;
    }
</style>

<{if $data.samint}>
    <{if $data.error}>
        <{$data.error}>
    <{else}>
        <{if $data.songinfo.ID > 0}>
            <table>
                <tr>
                    <th>Song Information</th>
                    <td class=lastplay>Last Played: <{$data.songinfo.date_played}></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class=category>Artist:</td>
                                <td colspan=4><{$data.songinfo.artist}></td>
                            </tr>
                            <tr>
                                <td class=category>Title:</td>
                                <td colspan=4><{$data.songinfo.title}></td>
                            </tr>
                            <tr>
                                <td class=category>Album:</td>
                                <td colspan=4><{$data.songinfo.album}></td>
                            </tr>
                            <tr>
                                <td class=category>Composer:</td>
                                <td colspan=4><{if $data.songinfo.composer}><{$data.songinfo.composer}><{else}>-<{/if}></td>
                            </tr>
                            <tr>
                                <td class=category>Track:</td>
                                <{if $data.songinfo.trackno > 0}>
                                    <td><{$data.songinfo.trackno}></td>
                                <{else}>
                                    <td>-</td>
                                <{/if}>
                                <td class=category>Time:</td>
                                <td><{$data.songinfo.mmss}></td>
                                <{if $data.showreq}>
                                    <td rowspan=2><a href="javascript:request(<{$data.songinfo.ID}>)">Request</a></td>
                                <{/if}>
                            </tr>
                            <tr>
                                <td class=category>Genre:</td>
                                <{if $data.songinfo.genre}>
                                    <td><{$data.songinfo.genre}></td>
                                <{else}>
                                    <td>-</td>
                                <{/if}>
                                <td class=category>Year:</td>
                                <{if $data.songinfo.albumyear}>
                                    <td><{$data.songinfo.albumyear}></td>
                                <{else}>
                                    <td>-</td>
                                <{/if}>
                            </tr>
                        </table>
                    </td>
                    <td class=album>
                        <{if $data.songinfo.picture}>
                            <img src="<{$data.baseurl}>/<{$data.djid}>/<{$data.songinfo.picture}>"
                                 onError="uhq_nocover(this)" class=albumcover>
                        <{else}>
                            <img src="/modules/uhqradio/images/nocover.png" class=albumcover>
                        <{/if}>
                    </td>
                </tr>
            </table>
            <table>
                <{if $data.songinfo.lyrics}>
                    <tr>
                        <th>Lyrics</th>
                    </tr>
                    <tr>
                        <td><{$data.songinfo.lyrics}></td>
                    </tr>
                <{/if}>
                <{if $data.songinfo.comments}>
                    <tr>
                        <th>Comments</th>
                    </tr>
                    <tr>
                        <td><{$data.songinfo.comments}></td>
                    </tr>
                <{/if}>
            </table>
        <{else}>
            Song Information Not Found
        <{/if}>
    <{/if}>
<{else}>
    Song Information Not Available
<{/if}>
<hr>
<div style="text-align: center;"><{$xoops_footer}></div>
</body>
</html>
