Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C865B75E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Jan 2023 22:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0946610E210;
	Mon,  2 Jan 2023 21:33:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 21:33:45 UTC
Received: from mail.att-mymble.info (unknown [45.95.212.181])
 by gabe.freedesktop.org (Postfix) with ESMTP id B33D410E1E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Jan 2023 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=att-mymble.info; 
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=att_news@att-mymble.info; bh=UQ8+dZKYehMOfLpEmz31qv2ANQg=;
 b=cce8KjlH5qH3gHhoeRiGRSFF5qindbv0hmzCEaRGQDZcg9x7H6IVft851IWo+3C3Jjl9+SJ8iG7R
 dAPIbxo7vy4qp5KlN/RnryW06HGxFnS7ZUDP8oosry8946fiQZHv+jHBiPEHcR1BVrbc7GjK3g5t
 uqG7U5SeBT+pOxg2dyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=att-mymble.info;
 b=KmPUYQjwH67HoS+pOnWAHBhGtEH1jcIK+lDmn4XfPV+xd8fTOrgiNfsosxElrCRo3eiA2bIb6uPy
 tV6qIprXOzzVWd++NQZgYYfKL5te+zD715ZS5mx0B8z0wTYqATImmFMvn9XYIsdYj5hTG+36ez1O
 3+4Q9anBopCfBa+nuB4=;
Received: by mail.att-mymble.info id hmd6ri0001gk for
 <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 2 Jan 2023 16:23:57 -0500 (envelope-from
 <att_news-intel+2Dgvt+2Ddev=lists.freedesktop.org@att-mymble.info>)
Date: Mon, 2 Jan 2023 16:23:57 -0500
From: "ATT News" <att_news@att-mymble.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: We have some exciting news for you
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_739_1822383798.1672694631137"
Message-ID: <0.0.0.51.1D91EF0862DDE10.1CBA78@mail.att-mymble.info>
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

------=_Part_739_1822383798.1672694631137
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
 <head> 
  <meta content="width=device-width" name="viewport" /> 
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" /> 
  <title>GoNevis</title> 
  <style type="text/css">img {
      border: none;
      -ms-interpolation-mode: bicubic;
      max-width: 100%;
    }
    
    body {
      background-color: #f6f6f6;
      font-family: sans-serif;
      -webkit-font-smoothing: antialiased;
      font-size: 14px;
      line-height: 1.4;
      margin: 0;
      padding: 0;
      -ms-text-size-adjust: 100%;
      -webkit-text-size-adjust: 100%;
    }
    
    table {
      border-collapse: separate;
      mso-table-lspace: 0pt;
      mso-table-rspace: 0pt;
      width: 100%;
    }
    
    table td {
      font-family: sans-serif;
      font-size: 14px;
      vertical-align: top;
    }
    
    .body {
      background-color: #f6f6f6;
      width: 100%;
    }
    
    .main-container {
      Margin: 0 auto !important;
      max-width: 580px;
      padding: 10px;
      width: 580px;
    }
    
    .content {
      box-sizing: border-box;
      display: block;
      Margin: 0 auto;
      max-width: 580px;
      padding: 10px;
    }
    
    .main {
      background: #ffffff;
      border-radius: 3px;
      width: 100%;
    }
    
    .wrapper {
      box-sizing: border-box;
      padding: 20px;
    }
    
    .content-block {
      padding-bottom: 10px;
      padding-top: 10px;
    }
    
    .footer {
      clear: both;
      Margin-top: 10px;
      text-align: center;
      width: 100%;
    }
    
    .footer td,
    .footer p,
    .footer span {
      color: #999999;
      font-size: 12px;
      text-align: center;
    }
    
    .footer a {
      text-decoration: none;
    }
    
    .footer .heart {
      color: #e74c3c;
    }
    
    h1,
    h2,
    h3,
    h4 {
      color: #000000;
      font-family: sans-serif;
      font-weight: 400;
      line-height: 1.4;
      margin: 0;
      Margin-bottom: 30px;
    }
    
    h1 {
      font-size: 35px;
      font-weight: 300;
      text-align: center;
      text-transform: capitalize;
    }
    
    p,
    ul,
    ol {
      font-family: sans-serif;
      font-size: 14px;
      font-weight: normal;
      margin: 0;
      Margin-bottom: 15px;
    }
    
    p li,
    ul li,
    ol li {
      list-style-position: inside;
      margin-left: 5px;
    }
    
    a {
      color: #d17100;
      text-decoration: none !important;
    }

    a.main-link {
      font-weight: bold;
      font-size: 2em;
      display: block;
      width: 100%;
      text-align: center !important;
      text-decoration: none;
    }

    a.mute {
      color: #aaa;
      text-decoration: none;
      font-style: italic;
    }
    
    .button {
      box-sizing: border-box;
      width: 100%;
    }
    
    .button>tbody>tr>td {
      padding-bottom: 15px;
    }
    
    .button table {
      width: auto;
    }
    
    .button table td {
      background-color: #ffffff;
      border-radius: 5px;
      text-align: center;
    }
    
    .button a {
      background-color: #ffffff;
      border: solid 1px #d17100;
      border-radius: 5px;
      box-sizing: border-box;
      color: #d17100;
      cursor: pointer;
      display: inline-block;
      font-size: 14px;
      font-weight: bold;
      margin: 0;
      padding: 12px 25px;
      text-decoration: none;
      text-transform: capitalize;
    }
    
    .button-primary table td {
      background-color: #d17100;
    }
    
    .button-primary a {
      background-color: #d17100;
      border-color: #d17100;
      color: #ffffff;
    }
    
    .last {
      margin-bottom: 0;
    }
    
    .first {
      margin-top: 0;
    }
    
    .align-center {
      text-align: center;
    }
    
    .align-right {
      text-align: right;
    }
    
    .align-left {
      text-align: left;
    }
    
    .clear {
      clear: both;
    }
    
    .mt0 {
      margin-top: 0;
    }
    
    .mb0 {
      margin-bottom: 0;
    }
    
    .preheader {
      color: transparent;
      display: none;
      height: 0;
      max-height: 0;
      max-width: 0;
      opacity: 0;
      overflow: hidden;
      mso-hide: all;
      visibility: hidden;
      width: 0;
    }
    
    .powered-by a {
      text-decoration: none;
    }
    
    hr {
      border: 0;
      border-bottom: 1px solid #f6f6f6;
      Margin: 20px 0;
    }
    
    @media only screen and (max-width: 620px) {
      table[class=body] h1 {
        font-size: 28px !important;
        margin-bottom: 10px !important;
      }
      table[class=body] p,
      table[class=body] ul,
      table[class=body] ol,
      table[class=body] td,
      table[class=body] span,
      table[class=body] a {
        font-size: 22x !important;
      }
      table[class=body] .wrapper,
      table[class=body] .article {
        padding: 10px !important;
      }
      table[class=body] .content {
        padding: 0 !important;
      }
      table[class=body] .main-container {
        padding: 0 !important;
        width: 100% !important;
      }
      table[class=body] .main {
        border-left-width: 0 !important;
        border-radius: 0 !important;
        border-right-width: 0 !important;
      }
      table[class=body] .button table {
        width: 100% !important;
      }
      table[class=body] .button a {
        width: 100% !important;
      }
      table[class=body] .img-responsive {
        height: auto !important;
        max-width: 100% !important;
        width: auto !important;
      }
    }
    
    @media all {
      .ExternalClass {
        width: 100%;
      }
      .ExternalClass,
      .ExternalClass p,
      .ExternalClass span,
      .ExternalClass font,
      .ExternalClass td,
      .ExternalClass div {
        line-height: 100%;
      }
      .apple-link a {
        color: inherit !important;
        font-family: inherit !important;
        font-size: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
        text-decoration: none !important;
      }
      .button-primary table td:hover {
        background-color: #34495e !important;
      }
      .button-primary a:hover {
        background-color: #34495e !important;
        border-color: #34495e !important;
      }
    }
	</style> 
 </head> 
 <body> 
  <table border="0" cellpadding="0" cellspacing="0" class="body"> 
   <tbody> 
    <tr> 
     <td>&nbsp;</td> 
     <td class="main-container"> 
      <div class="content"> 
       <table class="main"> 
        <tbody> 
         <tr> 
          <td class="wrapper"> 
           <table border="0" cellpadding="0" cellspacing="0"> 
            <tbody> 
             <tr> 
              <td> 
               <div style="padding: 1px; width: 100%"> 
                <div style="padding: 1px; width: 100%"> 
                 <div style="padding: 1px; width: 100%"> 
                  <div style="padding: 1px; width: 100%"> 
                   <div style="padding: 1px; width: 100%"> 
                    <div style="padding: 1px; width: 100%"> 
                     <div style="padding: 1px; width: 100%">
                      <span style="display: block; text-align: center; font-size: 32px; color: #0BA3DE"><strong>You are just a few clicks away to get The $100 AT&amp;T Card</strong> </span>
                     </div> 
                    </div> 
                   </div> 
                  </div> 
                 </div> 
                </div> 
               </div> 
               <div style="padding: 1px; width: 100%"> 
                <div style="padding: 1px; width: 100%"> 
                 <div style="padding: 1px; width: 100%"> 
                  <div style="padding: 1px; width: 100%"> 
                   <div style="padding: 1px; width: 100%"> 
                    <div style="padding: 1px; width: 100%"> 
                     <div style="padding: 1px; width: 100%">
                      <span><a href="http://www.att-mymble.info/slothful-notions/3004a2395jA8L613D44fYT0Y108dz36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7CQgdQK97urTg10h5m3XwD"><img alt="" src="http://www.att-mymble.info/Lindy-soundings/b344W2395S7ags12V44f2ZC108dp36obrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7tQgdQK97N1yt0qv6SU2@wD" width="100%" /></a></span>
                     </div> 
                    </div> 
                   </div> 
                  </div> 
                 </div> 
                </div> 
               </div> 
               <div style="padding: 1px; width: 100%"> 
                <div style="padding: 1px; width: 100%"> 
                 <div style="padding: 1px; width: 100%"> 
                  <div style="padding: 1px; width: 100%"> 
                   <div style="padding: 1px; width: 100%"> 
                    <div style="padding: 1px; width: 100%"> 
                     <div style="padding: 1px; width: 100%"> 
                      <table cellpadding="1" cellspacing="1" width="100%"> 
                       <tbody> 
                        <tr> 
                         <td style="font-size: 23px; text-align: center">Simply complete our 20-Second Service Survey about how your experience has been with us lately.</td> 
                        </tr> 
                       </tbody> 
                      </table> 
                     </div> 
                    </div> 
                   </div> 
                  </div> 
                 </div> 
                </div> 
               </div> 
               <div style="padding: 1px; width: 100%"> 
                <div style="padding: 1px; width: 100%"> 
                 <div style="padding: 1px; width: 100%"> 
                  <div style="padding: 1px; width: 100%"> 
                   <div style="padding: 1px; width: 100%"> 
                    <div style="padding: 1px; width: 100%"> 
                     <div style="padding: 1px; width: 100%"> 
                      <table cellpadding="1" cellspacing="1" width="100%"> 
                       <tbody> 
                        <tr> 
                         <td style="font-size: 23px; text-align: center"><a href="http://www.att-mymble.info/slothful-notions/3004a2395jA8L613D44fYT0Y108dz36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7CQgdQK97urTg10h5m3XwD" style="background-color: #0DA5DB; display: block; max-width: 260px; margin: auto auto; text-align: center; text-decoration: none; padding: 12px"><span style="color: #fff; padding: 12px; margin: auto; display: block; text-align: center; color:#fff; font-size: 20pt"><strong>Go Here To Start</strong></span></a></td> 
                        </tr> 
                       </tbody> 
                      </table> 
                     </div> 
                    </div> 
                   </div> 
                  </div> 
                 </div> 
                 <br /> 
                 <br /> 
                 <a href="http://www.att-mymble.info/slothful-notions/3004a2395jA8L613D44fYT0Y108dz36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7CQgdQK97urTg10h5m3XwD"><img alt="" src="http://www.att-mymble.info/nasally-deviations/e045zY2395s7aTP11y44f3s108dr36vbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7XQgdQK97b10Czht5QkwUD" /></a>
                </div> 
               </div> </td> 
             </tr> 
            </tbody> 
           </table> </td> 
         </tr> 
        </tbody> 
       </table> 
       <div class="footer"> 
        <table border="0" cellpadding="0" cellspacing="0"> 
         <tbody> 
          <tr> 
           <td class="content-block"><br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> To shut down messages,<a href="http://www.att-mymble.info/6dd5D23G95O8lO611H44f1y108dD36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7LQgdQK96u1F0VH6AqXwyD/Frederick-report" style="text-decoration-line: none;"> <span>Go Ahead Here </span> </a><br /> 126 E 23rd St New York, NY, US 10010<br /> <br /> <br /> <font><small></small></font><big></big><span></span><span face="pleasantness"></span></td> 
          </tr> 
         </tbody> 
        </table> 
       </div> 
      </div> </td> 
     <td>&nbsp;</td> 
    </tr> 
   </tbody> 
  </table>   
 <img src="http://www.att-mymble.info/ed56e2u39j5rO85t13B44CfY4i108dA36kbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7XQgdQK96uuCt106dBwDpk/Frederick-report" alt=""/></body>
</html>

------=_Part_739_1822383798.1672694631137--

