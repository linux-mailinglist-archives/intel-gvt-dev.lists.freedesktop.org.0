Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B365654F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Dec 2022 23:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2948B10E2C8;
	Mon, 26 Dec 2022 22:32:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 26 Dec 2022 22:32:02 UTC
Received: from mail.alt-mirclesht.info (unknown [104.223.234.136])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7731710E2C5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Dec 2022 22:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim;
 d=alt-mirclesht.info; 
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=miracle.sheets.team@alt-mirclesht.info; 
 bh=BGyP9FIDAklh7fP2gsIbnZqi1Uo=;
 b=gfUKtXPFQTLFhcE4455qFUP99vHWQ8Z+d0+pvhSMdRFtAL4vNr1Yoowbz4xOQSM+tjCwggf70AM9
 w1F2/zzSaLgy+qxSZwy7pRL694q4k/zHNqFp2bdgUXptChFvMhyybwebyGfgkqxcL3ZJ4ZSRjUCu
 c1WETBpYzJrnyMHoxbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=alt-mirclesht.info; 
 b=iWpFD1VhOhdh9G5aRKmJ7PutdWDSTOZGycFlPmn8Qw9UVliYaoRYPcpAtWeyrOEAc7wOBsbKoLc0
 wjMNNmGmjk8CaaeONJkCJ8jnxSsmpShmyFkIZp0eKsgSHaoQ8Hg++tcuaMh5+/L0eSAFxWnDw+1R
 TpvfrdqM93dxYX9Kaik=;
Received: by mail.alt-mirclesht.info id hl8ge40001g7 for
 <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Dec 2022 17:19:34 -0500 (envelope-from
 <miracle.sheets.team-intel+2Dgvt+2Ddev=lists.freedesktop.org@alt-mirclesht.info>)
Date: Mon, 26 Dec 2022 17:19:34 -0500
From: "Miracle Sheets Team" <miracle.sheets.team@alt-mirclesht.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_226_1857151395.1672093160474"
Message-ID: <0.0.0.19.1D91978220A1CDC.3F5093@mail.alt-mirclesht.info>
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

------=_Part_226_1857151395.1672093160474
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport" /> 
  <meta name="x-apple-disable-message-reformatting" /> 
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" /> 
  <title></title> 
  <style media="all" rel="stylesheet" type="text/css">/* Base ------------------------------ */
    
    @import url("https://fonts.googleapis.com/css?family=Nunito+Sans:400,700&display=swap");
    body {
      width: 100% !important;
      height: 100%;
      margin: 0;
      -webkit-text-size-adjust: none;
    }
    
    a {
      color: #3869D4;
    }
    
    a img {
      border: none;
    }
    
    td {
      word-break: break-word;
    }
    
    .preheader {
      display: none !important;
      visibility: hidden;
      mso-hide: all;
      font-size: 1px;
      line-height: 1px;
      max-height: 0;
      max-width: 0;
      opacity: 0;
      overflow: hidden;
    }
    /* Type ------------------------------ */
    
    body,
    td,
    th {
      font-family: "Nunito Sans", Helvetica, Arial, sans-serif;
    }
    
    h1 {
      margin-top: 0;
      color: #333333;
      font-size: 22px;
      font-weight: bold;
      text-align: left;
    }
    
    h2 {
      margin-top: 0;
      color: #333333;
      font-size: 16px;
      font-weight: bold;
      text-align: left;
    }
    
    h3 {
      margin-top: 0;
      color: #333333;
      font-size: 14px;
      font-weight: bold;
      text-align: left;
    }
    
    td,
    th {
      font-size: 16px;
    }
    
    p,
    ul,
    ol,
    blockquote {
      margin: .4em 0 1.1875em;
      font-size: 16px;
      line-height: 1.625;
    }
    
    p.sub {
      font-size: 13px;
    }
    /* Utilities ------------------------------ */
    
    .align-right {
      text-align: right;
    }
    
    .align-left {
      text-align: left;
    }
    
    .align-center {
      text-align: center;
    }
    
    .u-margin-bottom-none {
      margin-bottom: 0;
    }
    /* Buttons ------------------------------ */
    
    .button {
      background-color: #3869D4;
      border-top: 10px solid #3869D4;
      border-right: 18px solid #3869D4;
      border-bottom: 10px solid #3869D4;
      border-left: 18px solid #3869D4;
      display: inline-block;
      color: #FFF;
      text-decoration: none;
      border-radius: 3px;
      box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);
      -webkit-text-size-adjust: none;
      box-sizing: border-box;
    }
    
    .button--green {
      
    }
    
    .button--red {
      background-color: #FF6136;
      border-top: 10px solid #FF6136;
      border-right: 18px solid #FF6136;
      border-bottom: 10px solid #FF6136;
      border-left: 18px solid #FF6136;
    }
    
    @media only screen and (max-width: 500px) {
      .button {
        width: 100% !important;
        text-align: center !important;
      }
    }
    /* Attribute list ------------------------------ */
    
    .attributes {
      margin: 0 0 21px;
    }
    
    .attributes_content {
      background-color: #F4F4F7;
      padding: 16px;
    }
    
    .attributes_item {
      padding: 0;
    }
    /* Related Items ------------------------------ */
    
    .related {
      width: 100%;
      margin: 0;
      padding: 25px 0 0 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .related_item {
      padding: 10px 0;
      color: #CBCCCF;
      font-size: 15px;
      line-height: 18px;
    }
    
    .related_item-title {
      display: block;
      margin: .5em 0 0;
    }
    
    .related_item-thumb {
      display: block;
      padding-bottom: 10px;
    }
    
    .related_heading {
      border-top: 1px solid #CBCCCF;
      text-align: center;
      padding: 25px 0 10px;
    }
    /* Discount Code ------------------------------ */
    
    .discount {
      width: 100%;
      margin: 0;
      padding: 24px;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #F4F4F7;
      border: 2px dashed #CBCCCF;
    }
    
    .discount_heading {
      text-align: center;
    }
    
    .discount_body {
      text-align: center;
      font-size: 15px;
    }
    /* Social Icons ------------------------------ */
    
    .social {
      width: auto;
    }
    
    .social td {
      padding: 0;
      width: auto;
    }
    
    .social_icon {
      height: 20px;
      margin: 0 8px 10px 8px;
      padding: 0;
    }
    /* Data table ------------------------------ */
    
    .purchase {
      width: 100%;
      margin: 0;
      padding: 35px 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .purchase_content {
      width: 100%;
      margin: 0;
      padding: 25px 0 0 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .purchase_item {
      padding: 10px 0;
      color: #51545E;
      font-size: 15px;
      line-height: 18px;
    }
    
    .purchase_heading {
      padding-bottom: 8px;
      border-bottom: 1px solid #EAEAEC;
    }
    
    .purchase_heading p {
      margin: 0;
      color: #85878E;
      font-size: 12px;
    }
    
    .purchase_footer {
      padding-top: 15px;
      border-top: 1px solid #EAEAEC;
    }
    
    .purchase_total {
      margin: 0;
      text-align: right;
      font-weight: bold;
      color: #333333;
    }
    
    .purchase_total--label {
      padding: 0 15px 0 0;
    }
    
    body {
      background-color: #F2F4F6;
      color: #51545E;
    }
    
    p {
      color: #51545E;
    }
    
    .email-wrapper {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #F2F4F6;
    }
    
    .email-content {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    /* Masthead ----------------------- */
    
    .email-masthead {
      padding: 25px 0;
      text-align: center;
    }
    
    .email-masthead_logo {
      width: 94px;
    }
    
    .email-masthead_name {
      font-size: 16px;
      font-weight: bold;
      color: #A8AAAF;
      text-decoration: none;
      text-shadow: 0 1px 0 white;
    }
    /* Body ------------------------------ */
    
    .email-body {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .email-body_inner {
      width: 570px;
      margin: 0 auto;
      padding: 0;
      -premailer-width: 570px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #FFFFFF;
    }
    
    .email-footer {
      width: 570px;
      margin: 0 auto;
      padding: 0;
      -premailer-width: 570px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      text-align: center;
    }
    
    .email-footer p {
      color: #A8AAAF;
    }
    
    .body-action {
      width: 100%;
      margin: 30px auto;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      text-align: center;
    }
    
    .body-sub {
      margin-top: 25px;
      padding-top: 25px;
      border-top: 1px solid #EAEAEC;
    }
    
    .content-cell {
      padding: 45px;
    }
    /*Media Queries ------------------------------ */
    
    @media only screen and (max-width: 600px) {
      .email-body_inner,
      .email-footer {
        width: 100% !important;
      }
    }
	</style> 
 </head> 
 <body>
  <span class="preheader">&nbsp;</span> 
  <table cellpadding="0" cellspacing="0" class="email-wrapper" role="presentation" width="100%"> 
   <tbody> 
    <tr> 
     <td align="center"> 
      <table cellpadding="0" cellspacing="0" class="email-content" role="presentation" width="100%"> 
       <tbody> 
        <tr> 
         <td class="email-masthead">&nbsp;</td> 
        </tr> 
        <!-- Email Body --> 
        <tr> 
         <td cellpadding="0" cellspacing="0" class="email-body" width="570"> 
          <table align="center" cellpadding="0" cellspacing="0" class="email-body_inner" role="presentation" width="570">
           <!-- Body content --> 
           <tbody> 
            <tr> 
             <td class="content-cell"> 
              <div class="f-fallback"> 
               <center>
                <a href="http://www.alt-mirclesht.info/paraffin-nationalizing/y6c4U2395m8Ty611a4442I106fO36sbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdQRn6p10DZz5rTw1D"><img alt="" border="0" src="http://www.alt-mirclesht.info/15b5L23F95Py7Ba11d4444R106fH36tbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7PQWdQRn5t1l0t6yXLlwD/reconfiguring-scuttle" style="display:block; width: 100%; max-width: 100%;" /></a> 
                <h1 align="center" style="text-align: center; padding-top: 12px; font-size: 36px"><strong>Say Goodbye To Dirty<br /> Sheets This Christmas</strong></h1> 
               </center> 
               <p><a href="http://www.alt-mirclesht.info/paraffin-nationalizing/y6c4U2395m8Ty611a4442I106fO36sbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdQRn6p10DZz5rTw1D"><img alt="" src="http://www.alt-mirclesht.info/cd76X2yU395r7TQa11A4445X106fk36lbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7EQWdQRn7AWz1V0F5pywDB/natures-imagine" style="width: 100%" width="100%" /></a></p> 
               <p style="font-size: 25px; text-align: center">Are you tired of washing your sheets just for them to get smelly and dirty again? it's time to say goddbye to sweaty sleepless nights!</p> 
               <!-- Action --> 
               <table align="center" cellpadding="0" cellspacing="0" class="body-action" role="presentation" width="100%"> 
                <tbody> 
                 <tr> 
                  <td align="center">
                   <!-- Border based button
           https://litmus.com/blog/a-guide-to-bulletproof-buttons-in-email-design --> 
                   <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
                    <tbody> 
                     <tr> 
                      <td align="center"><a class="f-fallback button" href="http://www.alt-mirclesht.info/paraffin-nationalizing/y6c4U2395m8Ty611a4442I106fO36sbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdQRn6p10DZz5rTw1D" style=" background-color: #3869D4;
      border-top: 10px solid #3869D4;
      border-right: 18px solid #3869D4;
      border-bottom: 10px solid #3869D4;
      border-left: 18px solid #3869D4;
      display: inline-block;
      color: #FFF;
      text-decoration: none;
      border-radius: 3px;
      box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);
      -webkit-text-size-adjust: none;
      box-sizing: border-box;background-color: #22BC66;
      border-top: 10px solid #22BC66;
      border-right: 18px solid #22BC66;
      border-bottom: 10px solid #22BC66;
      border-left: 18px solid #22BC66; font-size: 26px" target="_blank"><strong>BUY MIRACLE SHEETS NOW</strong></a></td> 
                     </tr> 
                    </tbody> 
                   </table> </td> 
                 </tr> 
                </tbody> 
               </table> &nbsp; 
               <table cellpadding="0" cellspacing="0" class="attributes" role="presentation" width="100%"> 
                <tbody> 
                 <tr> 
                  <td class="attributes_content"> 
                   <table cellpadding="0" cellspacing="0" role="presentation" width="100%"> 
                    <tbody> 
                     <tr> 
                      <td class="attributes_item"> 
                       <div class="f-fallback"> 
                        <h1 align="center" style="text-align: center; margin-bottom: 0"><strong>30 DAYS MONEY BACK GUARANTEE</strong></h1> 
                       </div> </td> 
                     </tr> 
                     <tr> 
                      <td class="attributes_item">&nbsp;</td> 
                     </tr> 
                     <tr> 
                      <td class="attributes_item">&nbsp;</td> 
                     </tr> 
                     <tr> 
                      <td class="attributes_item">&nbsp;</td> 
                     </tr> 
                    </tbody> 
                   </table> </td> 
                 </tr> 
                </tbody> 
               </table> 
              </div> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td> 
          <table align="center" cellpadding="0" cellspacing="0" class="email-footer" role="presentation" width="570"> 
           <tbody> 
            <tr> 
             <td align="center" class="content-cell"><br /> <br /> To bring your subscription to an end,<a href="http://www.alt-mirclesht.info/crustacean-faithlessness/8dc4R2395QL86j11n4443r106fv36qbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7UQWdQRn7S1zP0HJ6z@wNDl" style="text-decoration-line: none;"> <span>Begin_Over_Here </span> </a><br /> 1501 Haines St. | Jacksonville, FL 32206<br /> <br /> <br /> <span><big></big><font color="punishing"></font><font lang="Normanizer"></span></font><big><style></style><font></big><style></style></font></td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table>   
 <img src="http://www.alt-mirclesht.info/98f4R2395Jrh8513p44_h46i106fz36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7DQWdQRn7EpnuY105KjlwD/blackmail-protested" alt=""/></body>
</html>

------=_Part_226_1857151395.1672093160474--

