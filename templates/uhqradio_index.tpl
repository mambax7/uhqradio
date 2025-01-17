<{if $data.samint == 0}>

    <{$smarty.const._MD_UHQRADIO_PLAYLIST_NA}>

<{else}>
    <script type="text/javascript">
        <!--
        function songinfo(songid) {
            window.open("pop_songinfo.php?songid=" + songid, "songinfowin", "location=no,status=no,menubar=no,scrollbars=yes,resizeable=yes,height=300,width=650");
        }

        function uhq_nocover(source) {
            source.src = "/modules/uhqradio/images/nocover.png";
            // disable onerror to prevent endless loop
            source.onerror = "";
            return true;
        }
        -->
    </script>
    <{if $data.op != "b_album"}>
        <a href="?op=b_album"><{$smarty.const._MD_UHQRADIO_INDEX_B_ALBUM}></a>
    <{else}>
        <{$smarty.const._MD_UHQRADIO_INDEX_B_ALBUM}>
    <{/if}>
    -
    <{if $data.op != "b_artist"}>
        <a href="?op=b_artist"><{$smarty.const._MD_UHQRADIO_INDEX_B_ARTIST}></a>
    <{else}>
        <{$smarty.const._MD_UHQRADIO_INDEX_B_ARTIST}>
    <{/if}>
    -
    <{if $data.op != "b_year"}>
        <a href="?op=b_year"><{$smarty.const._MD_UHQRADIO_INDEX_B_YEAR}></a>
    <{else}>
        <{$smarty.const._MD_UHQRADIO_INDEX_B_YEAR}>
    <{/if}>
    <hr>
    <table>
        <tr>
            <td><{$data.totalcount}>
                <{if ($data.op == "b_album") || ($data.op == "s_album") || ($data.op == "b_year") || ($data.op == "s_year") }>
                    <{if $data.totalcount == 1}><{$smarty.const._MD_UHQRADIO_INDEX_ALBUM}><{else}><{$smarty.const._MD_UHQRADIO_INDEX_ALBUMS}><{/if}>
                <{else}>
                    <{if $data.totalcount == 1}><{$smarty.const._MD_UHQRADIO_INDEX_ARTIST}><{else}><{$smarty.const._MD_UHQRADIO_INDEX_ARTISTS}><{/if}>
                <{/if}>
                <{$smarty.const._MD_UHQRADIO_INDEX_INDB}>
            </td>

            <{if $data.op != "b_year"}>
                <td align=right>:
                    <{foreach item=list from=$data.az}>
                        <a href="index.php?<{$list.link}>"><{$list.letter}></a>
                        .
                    <{/foreach}>
                </td>
            <{/if}>

    </table>
    <hr>
    <{if (($data.op == "b_album") || ($data.op == "b_artist")) }>

        <{if $data.start != null}>
            <p><{$data.itemcount}>
                <{if $data.start != 1}><{$smarty.const._MD_UHQRADIO_INDEX_ITEMS}><{else}><{$smarty.const._MD_UHQRADIO_INDEX_ITEM}><{/if}>
                <{$smarty.const._MD_UHQRADIO_INDEX_STARTWITH}>
                <{if $data.start}><{$data.start}><{else}><{$smarty.const._MD_UHQRADIO_INDEX_NUMBERS}><{/if}></p>
            <{if $data.itemcount > 0}>
                <{foreach item=list from=$data.itemlist}>
                    <{if $data.op == "b_album"}>
                        <div style="width:170px; height:190px; border-style:solid; border-width:1px; padding:5px; margin:5px; float:left; text-align:center;">
                            <a href="index.php?op=s_album&info=<{$list.linkcode}>">
                                <img src="<{$data.baseurl}>/<{$data.djid}>/<{$list.cover}>"
                                     style="max-width:160px; max-height:160px;"><br>
                                <{$list.album}></a>
                        </div>
                    <{/if}>
                    <{if $data.op == "b_artist"}><a href="?op=s_artist&info=<{$list.linkcode}>"
                                                    align=left><{$list.artist}></a>
                        <br>
                    <{/if}>
                <{/foreach}>
            <{/if}>
        <{else}>
            <h3><{$smarty.const._MD_UHQRADIO_INDEX_LAST}> <{$data.albumlimit}> <{$smarty.const._MD_UHQRADIO_INDEX_ADDS}></h3>
            <{foreach item=list from=$data.newalbums}>
                <div style="overflow:hidden; padding:2px;">
                    <a href="index.php?op=s_album&info=<{$list.linkcode}>">
                        <img src="<{$data.baseurl}>/<{$data.djid}>/<{$list.cover}>" width=40 height=40 align=left
                             padding=2px>
                    </a><i><{$list.album}></i><br><{$list.date_add}>
                </div>
            <{/foreach}>
        <{/if}>
    <{elseif $data.op == 'b_year'}>
        <h3>Year of Production</h3>
        <table>
            <{foreach item=list from=$data.yearlist}>
                <tr>
                    <td><{$list.albumyear}></td>
                    <td><{$list.count}></td>

                </tr>
            <{/foreach}>
        </table>
    <{elseif $data.op == 's_album'}>
        <table>
            <tr>
                <td width=170px>
                    <img src="<{$data.baseurl}>/<{$data.djid}>/<{$data.album.picture}>" onerror="uhq_nocover(this)">
                </td>
                <td width=400px align=left>
                    <h3><{$data.album.name}></h3>

                    <p><{$data.album.artist}></p>

                    <p><{$smarty.const._MD_UHQRADIO_INDEX_SA_GENRE}>: <{$data.album.genre}></p>

                    <p>
                        <{if $data.album.label}>
                            <{$smarty.const._MD_UHQRADIO_INDEX_SA_LYEAR}>: <{$data.album.label}> -
                        <{else}>
                            <{$smarty.const._MD_UHQRADIO_INDEX_SA_YEAR}>:
                        <{/if}>
                        <{$data.album.year}>
                    </p>

                    <p><{$smarty.const._MD_UHQRADIO_INDEX_SA_DATE}>: <{$data.album.added}></p>
                </td>
            </tr>
        </table>
        <table width=400px>
            <tr>
                <th width=1%>#</th>
                <th><{$smarty.const._MD_UHQRADIO_INDEX_ARTIST}></th>
                <th><{$smarty.const._MD_UHQRADIO_INDEX_TITLE}></th>
                <th><{$smarty.const._MD_UHQRADIO_INDEX_DURATION}></th>
                <th><{$smarty.const._MD_UHQRADIO_INDEX_LINK}></th>
            </tr>
            <{foreach item=list from=$data.track}>
                <tr class="<{cycle values=" odd,odd,even,even"}>">
                    <td><{if $list.trackno}><{$list.trackno}><{else}>-<{/if}></td>
                    <td><{$list.artist}></td>
                    <td><{$list.title}></td>
                    <td><{$list.mmss}></td>
                    <td><a href="javascript:songinfo(<{$list.ID}>)"><{$smarty.const._MD_UHQRADIO_INDEX_INFO}></a></td>
                </tr>
            <{/foreach}>
        </table>
    <{elseif $data.op == "s_artist"}>
        <{$data.trackcount}> <{$smarty.const._MD_UHQRADIO_INDEX_TRACKSBY}>
        <i><{$data.artist}></i>
        <hr>
        <{foreach item=album from=$data.album}>
            <div style="border-style:solid; border-width:1px; padding:5px; margin:5px; overflow:hidden;">
                <div style="width:170px; float:left; text-align:center;">
                    <img src="<{$data.baseurl}>/<{$data.djid}>/<{$album.picture}>" style="max-width:160px;"
                         onerror="uhq_nocover(this)"><br>

                    <p><b><{$album.name}></b> (<{$album.year}>)</p>

                    <p><{$album.label}></p>

                    <p><{$album.genre}></p>
                </div>
                <div style="margin-left:180px;">
                    <table>
                        <tr>
                            <th style="width:20px;">#</th>
                            <th><{$smarty.const._MD_UHQRADIO_INDEX_TITLE}></th>
                            <th style="width:40px;"><{$smarty.const._MD_UHQRADIO_INDEX_LINK}></th>
                            <th style="width:40px;"><{$smarty.const._MD_UHQRADIO_INDEX_DURATION}></th>
                        </tr>
                        <{foreach item=track from=$album.track}>
                            <tr class="<{cycle values=" odd,odd,even,even"}>">
                                <td><{if $track.trackno}><{$track.trackno}><{else}>-<{/if}></td>
                                <td><{$track.title}></td>
                                <td>
                                    <a href="javascript:songinfo(<{$track.ID}>)"><{$smarty.const._MD_UHQRADIO_INDEX_INFO}></a>
                                </td>
                                <td><{$track.mmss}></td>
                            </tr>
                        <{/foreach}>
                    </table>
                </div>
            </div>
        <{/foreach}>
    <{/if}>

<{/if}>
