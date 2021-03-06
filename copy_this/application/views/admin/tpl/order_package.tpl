[{include file="headitem.tpl" title="ORDER_PACKAGE_TITLE"|oxmultilangassign box=" "}]

<script type="text/javascript">
<!--
function printWindow()
{
    bV = parseInt(navigator.appVersion);
    if (bV >= 4)
        window.print();
}
//  End -->
</script>

<style media="print"> #noprint{ display:none; }</style>
<br>
<div id="noprint"><br>
<a class="listitem" href="javascript:printWindow();"><b>[{ oxmultilang ident="ORDER_PACKAGE_SHOWPACKLIST" }]</b></a>
</div>

<span class="listitem">
<h2>[{ oxmultilang ident="ORDER_PACKAGE_PACKLIST" }]</h2>
</span>

[{foreach from=$resultset item=order}]

<table cellspacing="0" cellpadding="0" border="0" width="98%" style="padding-top : 10px; padding-bottom : 10px; padding-left : 5px;  padding-right : 5px; border : 1px #000000; border-style : solid solid solid solid;">
<tr>
    <td class="listitem" width="150" valign="top">
        <b>[{ oxmultilang ident="GENERAL_BILLADDRESS" }]<br></b>
        [{ $order->oxorder__oxbillsal->value|oxmultilangsal}]&nbsp;[{ $order->oxorder__oxbillfname->value }]&nbsp;[{ $order->oxorder__oxbilllname->value }]<br>
        [{ $order->oxorder__oxbillcompany->value }]<br>
        [{ $order->oxorder__oxbillstreet->value }]  [{ $order->oxorder__oxbillstreetnr->value }]<br>
        [{ $order->oxorder__oxbillzip->value }]&nbsp;[{ $order->oxorder__oxbillcity->value }]<br>
        [{ $order->oxorder__oxbillcountry->value }]<br>
        [{ oxmultilang ident="GENERAL_USTID" }]: [{ $order->oxorder__oxbillustid->value}]<br>
        [{ $order->oxorder__oxbilladdinfo->value }]<br>
        [{ oxmultilang ident="ORDER_PACKAGE_FON" }]: [{ $order->oxorder__oxbillfon->value }]<br>
        [{ oxmultilang ident="ORDER_PACKAGE_FAX" }]: [{ $order->oxorder__oxbillfax->value }]<br>
        [{ if $order->oxorder__oxremark->value }]<b><br>[{ oxmultilang ident="ORDER_PACKAGE_REMARK" }]: <br>[{ $order->oxorder__oxremark->value }]</b><br>[{/if}]
    </td>
    <td class="listitem" width="150" valign="top">
        <b>[{ oxmultilang ident="GENERAL_DELIVERYADDRESS" }]:<br></b>
        [{ if $order->oxorder__oxdelsal->value }][{$order->oxorder__oxdelsal->value|oxmultilangsal}][{else}][{$order->oxorder__oxbillsal->value|oxmultilangsal}][{/if}]&nbsp;[{if $order->oxorder__oxdelfname->value}][{ $order->oxorder__oxdelfname->value }][{ else }][{ $order->oxorder__oxbillfname->value }][{/if}]&nbsp;[{if $order->oxorder__oxdellname->value }][{$order->oxorder__oxdellname->value }][{else}][{$order->oxorder__oxbilllname->value }][{/if}]<br>
        [{ if $order->oxorder__oxdelcompany->value }][{ $order->oxorder__oxdelcompany->value }][{else}][{ $order->oxorder__oxbillcompany->value }][{/if}]<br>
        [{ if $order->oxorder__oxdelstreet->value }][{ $order->oxorder__oxdelstreet->value }]&nbsp;[{ $order->oxorder__oxdelstreetnr->value }][{else}][{ $order->oxorder__oxbillstreet->value }]&nbsp;[{ $order->oxorder__oxbillstreetnr->value }][{/if}]<br>
        [{ if $order->oxorder__oxdelzip->value }][{ $order->oxorder__oxdelzip->value }][{else}][{ $order->oxorder__oxbillzip->value }][{/if}]&nbsp;[{ if $order->oxorder__oxdelcity->value }][{ $order->oxorder__oxdelcity->value }][{else}][{ $order->oxorder__oxbillcity->value }][{/if}]<br>
        [{ if $order->oxorder__oxdelcountry->value }][{ $order->oxorder__oxdelcountry->value }][{else}][{ $order->oxorder__oxbillcountry->value }][{/if}]<br>
        [{ if $order->oxorder__oxdeladdinfo->value }][{ $order->oxorder__oxdeladdinfo->value }][{else}][{ $order->oxorder__oxbilladdinfo->value }][{/if}]<br><br>
        [{ oxmultilang ident="ORDER_PACKAGE_FON" }]: [{ if $order->oxorder__oxdelfon->value }][{ $order->oxorder__oxdelfon->value }][{else}][{ $order->oxorder__oxbillfon->value }][{/if}]<br>
        [{ oxmultilang ident="ORDER_PACKAGE_FAX" }]: [{ if $order->oxorder__oxdelfax->value }][{ $order->oxorder__oxdelfax->value }][{else}][{ $order->oxorder__oxbillfax->value }][{/if}]<br>
    </td>
    <td class="packitem" valign="top">
        [{ oxmultilang ident="ORDER_PACKAGE_ORDERNR1" }][{ $order->oxorder__oxordernr->value}] - [{ oxmultilang ident="ORDER_PACKAGE_ORDERNR2" }] [{ $order->oxorder__oxorderdate->value|oxformdate:"datetime":true }]<br><br>
        [{* ---- jxInventory Extension - Begin ---- *}]
        [{assign var=jxLineStyle value="font-weight:bold;background-color:#efefef;"}]
        [{* ---- jxInventory Extension - End ---- *}]
        <table cellspacing="2" cellpadding="0" border="0" width="100%">
        [{foreach from=$order->getOrderArticles(true) item=article}]
            <tr>
                <td class="packitem" valign="top"><div style="[{$jxLineStyle}]">[{ $article->oxorderarticles__oxamount->value }]</div></td>
                <td class="packitem" valign="top"><div style="[{$jxLineStyle}]">[{ $article->oxorderarticles__oxartnum->value }]</div></td>
                <td class="packitem" valign="top"><div style="[{$jxLineStyle}]">[{ $article->oxorderarticles__oxtitle->value }]</div>
                    [{* ---- jxInventory Extension - Begin ---- *}]
                    [{assign var=jxInv value=$article->jxGetInventoryLocation()}]
                    [{* $article->oxorderarticles__oxid->value *}] 
                    [{if $jxInv }]
                    <span style="color:#00aa00;">[{ $jxInv.Site }] - [{ $jxInv.Store }] - [{ $jxInv.Rack }] - [{ $jxInv.Level }]</span>
                    [{else}]
                    <span style="color:#aa0000; font-style:italic">[{ oxmultilang ident="JXINVENTORY_NOTPRESENT" }]</san>
                    [{/if}]
                    [{* ---- jxInventory Extension - End ---- *}]

                [{foreach key=sVar from=$article->getPersParams() item=aParam name=persparams}]
                    [{if $aParam }]
                        <br />
                        [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                            [{ oxmultilang ident="ORDER_PACKAGE_DETAILS" }] 
                        [{else}]
                            [{$sVar}] : 
                        [{/if}]
                        [{$aParam}]
                    [{/if }]
                [{/foreach}]

                </td>
                <td class="packitem" valign="top"><div style="[{$jxLineStyle}]">[{ $article->oxorderarticles__oxselvariant->value}]&nbsp;</div></td>
                <td class="packitem" valign="top"><img src="[{$oViewConf->getImageUrl()}]/rectangle.gif" alt="" width="20" height="20" border="0"></td>
            </tr>
            [{assign var=_wrap value=$article->getWrapping()}]
            [{if $_wrap }]
                <tr>
                    <td class="listitem" valign="top"></td>
                    <td class="listitem" valign="top"></td>
                    <td class="listitem" valign="top">[{ $_wrap->oxwrapping__oxname->value }]</td>
                    <td class="listitem" valign="top"></td>
                    <td class="listitem" valign="middle"></td>
                </tr>
            [{/if}]
        [{/foreach}]

        [{assign var=_card value=$order->getGiftCard()}]
        [{if $_card}]
        <tr>
            <td class="listitem" valign="top"></td>
            <td class="listitem" valign="top"></td>
            <td class="listitem" valign="top"><b>[{ $_card->oxwrapping__oxname->value }]</b></td>
            <td class="listitem" valign="top"></td>
            <td class="listitem" valign="middle"></td>
        </tr>
        [{/if}]
        </table>
    </td>
</tr>
</table>
<br>
[{/foreach}]

<script type="text/javascript">
if (parent.parent)
{   parent.parent.sShopTitle   = "[{$actshopobj->oxshops__oxname->getRawValue()|oxaddslashes}]";
    parent.parent.sMenuItem    = "[{ oxmultilang ident="ORDER_PACKAGE_MENUITEM" }]";
    parent.parent.sMenuSubItem = "[{ oxmultilang ident="ORDER_PACKAGE_MENUSUBITEM" }]";
    parent.parent.sWorkArea    = "[{$_act}]";
    parent.parent.setTitle();
}
</script>
</body>
</html>
