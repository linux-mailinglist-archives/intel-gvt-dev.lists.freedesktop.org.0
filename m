Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CEF6586E4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Dec 2022 22:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3410E1C9;
	Wed, 28 Dec 2022 21:04:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 28 Dec 2022 21:03:59 UTC
Received: from mail.ms-upsgway.info (unknown [104.223.234.147])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A56110E1C9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Dec 2022 21:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=ms-upsgway.info; 
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=ups.news@ms-upsgway.info; bh=n9BQWCaVfnH6jk05QZ7p74hBi5k=;
 b=qCrVFQ/eudldhJZBpKrgrxKvrtmHGkKiXR23lc7I8L9eMl345nkEQ/SMGRFXwTPKo06rC7CN6iVM
 kCLpdvsohIxqU0r87br0EkNd5Z45gIyXgzj6BcCeW0RdLKOcuwi/xex7jiD5swcc19Gh7D4vrpxv
 rMSCvJDcVO87lTIPYzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=ms-upsgway.info;
 b=eptuf7UN9OaNIjhtbQjRDA8z2s7HvdLuYDL5EeeR3/bnmpNc9+q1h6jYC1AgRIg5gMEZgM/9MZrJ
 e6SouZmzxOCitHdbAY8BuQfOobNWSZQEiCT5kXJMjR6qim9IhoUMb4scSZVtvQXTt4xdoSf9Rzy2
 /eSzdRvYasvw1PW/EzY=;
Received: by mail.ms-upsgway.info id hlinju0001gt for
 <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Dec 2022 15:51:09 -0500 (envelope-from
 <ups.news-intel+2Dgvt+2Ddev=lists.freedesktop.org@ms-upsgway.info>)
Date: Wed, 28 Dec 2022 15:51:09 -0500
From: "Ups News" <ups.news@ms-upsgway.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: ups User Feedback
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_217_1202775726.1672260665954"
Message-ID: <0.0.0.18.1D91AFE1D1669EC.10DB5E@mail.ms-upsgway.info>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

------=_Part_217_1202775726.1672260665954
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml">
 <head> 
  <meta charset="utf-8" />
  <!-- utf-8 works for most cases --> 
  <meta content="width=device-width" name="viewport" />
  <!-- Forcing initial-scale shouldn't be necessary --> 
  <title></title> 
  <style type="text/css">/* What it does: Remove spaces around the email design added by some email clients. */
        /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
        html,
        body {
            margin: 0 auto !important;
            padding: 0 !important;
            height: 100% !important;
            width: 100% !important;
        }

        /* What it does: Stops email clients resizing small text. */
        * {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        /* What it does: Centers email on Android 4.4 */
        div[style*="margin: 16px 0"] {
            margin: 0 !important;
        }

        /* What it does: forces Samsung Android mail clients to use the entire viewport */
        #MessageViewBody, #MessageWebViewDiv{
            width: 100% !important;
        }

        /* What it does: Stops Outlook from adding extra spacing to tables. */
        table,
        td {
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
        }

        /* What it does: Replaces default bold style. */
        th {
        	font-weight: normal;
        }

        /* What it does: Fixes webkit padding issue. */
        table {
            border-spacing: 0 !important;
            border-collapse: collapse !important;
            table-layout: fixed !important;
            margin: 0 auto !important;
        }

        /* What it does: Prevents Windows 10 Mail from underlining links despite inline CSS. Styles for underlined links should be inline. */
        a {
            text-decoration: none;
        }

        /* What it does: Uses a better rendering method when resizing images in IE. */
        img {
            -ms-interpolation-mode:bicubic;
        }

        /* What it does: A work-around for email clients meddling in triggered links. */
        a[x-apple-data-detectors],  /* iOS */
        .unstyle-auto-detected-links a,
        .aBn {
            border-bottom: 0 !important;
            cursor: default !important;
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        /* What it does: Prevents Gmail from changing the text color in conversation threads. */
        .im {
            color: inherit !important;
        }

        /* What it does: Prevents Gmail from displaying a download button on large, non-linked images. */
        .a6S {
           display: none !important;
           opacity: 0.01 !important;
		}
		/* If the above doesn't work, add a .g-img class to any image in question. */
		img.g-img + div {
		   display: none !important;
		}

        /* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
        /* Create one of these media queries for each additional viewport size you'd like to fix */

        /* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
        @media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
            u ~ div .email-container {
                min-width: 320px !important;
            }
        }
        /* iPhone 6, 6S, 7, 8, and X */
        @media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
            u ~ div .email-container {
                min-width: 375px !important;
            }
        }
        /* iPhone 6+, 7+, and 8+ */
        @media only screen and (min-device-width: 414px) {
            u ~ div .email-container {
                min-width: 414px !important;
            }
        }
	</style> 
  <!-- CSS Reset : END -->
  <!-- Progressive Enhancements : BEGIN --> 
  <style type="text/css">/* What it does: Hover styles for buttons */
        .button-td,
        .button-a {
            transition: all 100ms ease-in;
        }
	    .button-td-primary:hover,
	    .button-a-primary:hover {
	        background: #555555 !important;
	        border-color: #555555 !important;
	    }

        /* Media Queries */
        @media screen and (max-width: 600px) {

            .email-container {
                width: 100% !important;
                margin: auto !important;
            }

            /* What it does: Forces table cells into full-width rows. */
            .stack-column,
            .stack-column-center {
                display: block !important;
                width: 100% !important;
                max-width: 100% !important;
                direction: ltr !important;
            }
            /* And center justify these ones. */
            .stack-column-center {
                text-align: center !important;
            }

            /* What it does: Generic utility class for centering. Useful for images, buttons, and nested tables. */
            .center-on-narrow {
                text-align: center !important;
                display: block !important;
                margin-left: auto !important;
                margin-right: auto !important;
                float: none !important;
            }
            table.center-on-narrow {
                display: inline-block !important;
            }

            /* What it does: Adjust typography on small screens to improve readability */
            .email-container p {
                font-size: 17px !important;
            }
        }
	</style> 
  <!-- Progressive Enhancements : END --> 
 </head> 
 <body class="email-bg" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #eee;" width="100%"> 
  <center aria-roledescription="email" class="email-bg" lang="en" role="article" style="width: 100%; background-color: #eee;">
   <!-- Visually Hidden Preheader Text : BEGIN --> 
   <div aria-hidden="true" style="max-height:0; overflow:hidden; mso-hide:all;">
    &nbsp;
   </div> 
   <div style="display: none; font-size: 1px; line-height: 1px; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;">
    ?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;?&nbsp;
   </div> 
   <!-- Preview Text Spacing Hack : END -->
   <!-- Email Body : BEGIN --> 
   <table align="center" border="0" cellpadding="0" cellspacing="0" class="email-container" role="presentation" style="margin: auto;" width="600">
    <!-- Email Header : BEGIN --> 
    <tbody> 
     <tr> 
      <td style="padding: 20px 0; text-align: center; color: #3C4121; font-size: 29px; font-family: sans-serif"><strong>You are just a few clicks away<br /> to get The $100 UPS Card</strong></td> 
     </tr> 
     <!-- Email Header : END -->
     <!-- Hero Image, Flush : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" style="background-color: #ffffff;"><a href="http://www.ms-upsgway.info/9e95Cj2395LS8s611h4473V1079X36jbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7WQLdQSo7MsR1i0o5KAwDX/lapel-familiarities"><img alt="alt_text" border="0" class="g-img" height="" src="http://www.ms-upsgway.info/confederation-dons/c9c4H2395hMj7a12u44D75R1079i36ObrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7VQLdQSo6L1wIP06GA2@wD" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 15px; color: #555555; margin: auto; display: block;" width="600" /></a></td> 
     </tr> 
     <!-- Hero Image, Flush : END -->
     <!-- 1 Column Text + Button : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" style="background-color: #ffffff;"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr> 
          <td style="padding: 20px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;"> <h1 align="center" style="margin: 0 0 10px; font-size: 25px; line-height: 30px; color: #333333; font-weight: normal;"><strong>We Appreciate your opinion</strong></h1> <p style="margin: 20 0 10px; font-size: 26px; text-align: center; line-height: normal">Simply complete our 20-Second Service Survey about how your experience has been with us lately</p> </td> 
         </tr> 
         <tr> 
          <td style="padding: 0 20px 20px;">
           <!-- Button : BEGIN --> 
           <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="margin: auto;"> 
            <tbody> 
             <tr> 
              <td class="button-td button-td-primary" style="border-radius: 4px; background: #eee;"><a class="button-a button-a-primary" href="http://www.ms-upsgway.info/9e95Cj2395LS8s611h4473V1079X36jbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7WQLdQSo7MsR1i0o5KAwDX/lapel-familiarities" style="background:  #3C4121; border: 1px solid #000000; font-family: sans-serif; font-size: 25px; line-height: 15px; text-decoration: none; padding: 13px 17px; color: #ffffff; display: block; border-radius: 4px;">Go Here To Start</a></td> 
             </tr> 
            </tbody> 
           </table> <br /> <br /> 
           <!-- Button : END --></td> 
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
     <!-- 1 Column Text + Button : END -->
     <!-- Background Image with Text : BEGIN --> 
     <tr>
      <!-- Bulletproof Background Images c/o https://backgrounds.cm --> 
      <td style="text-align: center; background-color: #eee; background-position: center center !important; background-size: cover !important;" valign="middle"> 
       <div> 
        <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
         <tbody> 
          <tr> 
           <td style="text-align: center; padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #ffffff;" valign="middle"> <p style="margin: 0;">&nbsp;</p> </td> 
          </tr> 
         </tbody> 
        </table> 
       </div> </td> 
     </tr> 
     <!-- Background Image with Text : END -->
     <!-- 2 Even Columns : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" style="padding: 10px; background-color: #ffffff;"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr>
          <!-- Column : BEGIN --> 
          <th class="stack-column-center" valign="top" width="50%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td style="padding: 10px; text-align: center">&nbsp;</td> 
             </tr> 
             <tr> 
              <td class="center-on-narrow" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 0 10px 10px; text-align: left;"> <p style="margin: 0;">&nbsp;</p> </td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END -->
           <!-- Column : BEGIN --> </th>
          <th class="stack-column-center" valign="top" width="50%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td style="padding: 10px; text-align: center">&nbsp;</td> 
             </tr> 
             <tr> 
              <td class="center-on-narrow" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 0 10px 10px; text-align: left;"> <p style="margin: 0;">&nbsp;</p> </td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END --> </th>
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
     <!-- 2 Even Columns : END -->
     <!-- 3 Even Columns : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" style="padding: 10px; background-color: #ffffff;"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr>
          <!-- Column : BEGIN --> 
          <th class="stack-column-center" valign="top" width="33.33%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td style="padding: 10px; text-align: center">&nbsp;</td> 
             </tr> 
             <tr> 
              <td class="center-on-narrow" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 0 10px 10px; text-align: left;"> <p style="margin: 0;">&nbsp;</p> </td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END -->
           <!-- Column : BEGIN --> </th>
          <th class="stack-column-center" valign="top" width="33.33%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td style="padding: 10px; text-align: center">&nbsp;</td> 
             </tr> 
             <tr> 
              <td class="center-on-narrow" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 0 10px 10px; text-align: left;"> <p style="margin: 0;">&nbsp;</p> </td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END -->
           <!-- Column : BEGIN --> </th>
          <th class="stack-column-center" valign="top" width="33.33%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td style="padding: 10px; text-align: center">&nbsp;</td> 
             </tr> 
             <tr> 
              <td class="center-on-narrow" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 0 10px 10px; text-align: left;"> <p style="margin: 0;">&nbsp;</p> </td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END --> </th>
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
     <!-- 3 Even Columns : END -->
     <!-- Thumbnail Left, Text Right : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" dir="ltr" style="padding: 10px; background-color: #ffffff;" width="100%"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr>
          <!-- Column : BEGIN --> 
          <th class="stack-column-center" width="33.33%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td dir="ltr" style="padding: 0 10px;" valign="top">&nbsp;</td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END -->
           <!-- Column : BEGIN --> </th>
          <th class="stack-column-center" width="66.66%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td class="center-on-narrow" dir="ltr" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 10px; text-align: left;" valign="top"> <h2 style="margin: 0 0 10px 0; font-family: sans-serif; font-size: 18px; line-height: 22px; color: #333333; font-weight: bold;">&nbsp;</h2> <p style="margin: 0 0 10px 0;">&nbsp;</p> 
               <!-- Button : BEGIN --> 
               <table border="0" cellpadding="0" cellspacing="0" class="center-on-narrow" role="presentation" style="float:left;"> 
                <tbody> 
                 <tr> 
                  <td class="button-td button-td-primary" style="border-radius: 4px; background: #eee;">&nbsp;</td> 
                 </tr> 
                </tbody> 
               </table> 
               <!-- Button : END --></td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END --> </th>
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
     <!-- Thumbnail Left, Text Right : END -->
     <!-- Thumbnail Right, Text Left : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" dir="rtl" style="padding: 10px; background-color: #ffffff;" width="100%"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr>
          <!-- Column : BEGIN --> 
          <th class="stack-column-center" width="33.33%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td dir="ltr" style="padding: 0 10px;" valign="top">&nbsp;</td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END -->
           <!-- Column : BEGIN --> </th>
          <th class="stack-column-center" width="66.66%"> 
           <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
            <tbody> 
             <tr> 
              <td class="center-on-narrow" dir="ltr" style="font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555; padding: 10px; text-align: left;" valign="top"> <h2 style="margin: 0 0 10px 0; font-family: sans-serif; font-size: 18px; line-height: 22px; color: #333333; font-weight: bold;">&nbsp;</h2> <p style="margin: 0 0 10px 0;">&nbsp;</p> 
               <!-- Button : BEGIN --> 
               <table border="0" cellpadding="0" cellspacing="0" class="center-on-narrow" role="presentation" style="float:left;"> 
                <tbody> 
                 <tr> 
                  <td class="button-td button-td-primary" style="border-radius: 4px; background: #eee;">&nbsp;</td> 
                 </tr> 
                </tbody> 
               </table> 
               <!-- Button : END --></td> 
             </tr> 
            </tbody> 
           </table>  
           <!-- Column : END --> </th>
         </tr> 
        </tbody> 
       </table> 
       <center>
        To quit notices,
        <a href="http://www.ms-upsgway.info/lavish-predictable/8825j2V395mh86u11b4474z1079r36MbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7oQLdQSo5u1mQ06kAUwPD" style="text-decoration-line: none; color: red"> <span>Begin Over Here </span> </a>
        <br /> 126 E 23rd St New York, NY, US 10010
        <br /> 
        <br /> 
        <br /> 
        <br /> 
        <br /> <font size="worthless"></font><font><span></span><font><small></small><font lang="insulting"></font><span></span></font><span><span dir="recoiling"></font></span></span>
       </center> <br /> <br /> &nbsp;</td> 
     </tr> 
     <!-- Thumbnail Right, Text Left : END -->
     <!-- Clear Spacer : BEGIN --> 
     <tr> 
      <td aria-hidden="true" height="40" style="font-size: 0px; line-height: 0px;">&nbsp;</td> 
     </tr> 
     <!-- Clear Spacer : END -->
     <!-- 1 Column Text : BEGIN --> 
     <tr> 
      <td class="darkmode-bg" style="background-color: #ffffff;"> 
       <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
        <tbody> 
         <tr> 
          <td style="padding: 20px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;"> <p style="margin: 0;">&nbsp;</p> </td> 
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
     <!-- 1 Column Text : END --> 
    </tbody> 
   </table> 
   <!-- Email Body : END -->
   <!-- Email Footer : BEGIN --> 
   <table align="center" border="0" cellpadding="0" cellspacing="0" class="footer" role="presentation" style="margin: auto;" width="600"> 
    <tbody> 
     <tr> 
      <td style="padding: 20px; font-family: sans-serif; font-size: 12px; line-height: 15px; text-align: center; color: #ffffff;">&nbsp;</td> 
     </tr> 
    </tbody> 
   </table> 
   <!-- Email Footer : END -->
   <!-- Full Bleed Background Section : BEGIN --> 
   <table border="0" cellpadding="0" cellspacing="0" class="darkmode-fullbleed-bg" role="presentation" style="background-color: #709f2b;" width="100%"> 
    <tbody> 
     <tr> 
      <td> 
       <div align="center" class="email-container" style="max-width: 600px; margin: auto;"> 
        <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
         <tbody> 
          <tr> 
           <td style="padding: 20px; text-align: left; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #ffffff;"> <p style="margin: 0;">&nbsp;</p> </td> 
          </tr> 
         </tbody> 
        </table> 
       </div> </td> 
     </tr> 
    </tbody> 
   </table> 
  </center>   
 <img src="http://www.ms-upsgway.info/1794p2395g85wC12cC4476Z1079P36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7aQLdQSo5z1js06CqlPwD/prostration-agreements" alt=""/></body>
</html>

------=_Part_217_1202775726.1672260665954--

