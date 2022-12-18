Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDA65042D
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 18 Dec 2022 18:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41DF10E1E7;
	Sun, 18 Dec 2022 17:25:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Sun, 18 Dec 2022 17:25:40 UTC
Received: from mail.sogekng.info (unknown [104.223.183.224])
 by gabe.freedesktop.org (Postfix) with ESMTP id D02E610E0F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 18 Dec 2022 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=sogekng.info;
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=shirley_barton@sogekng.info; 
 bh=Yphm+wRQk09vDWwTVW3Rt/7FrYI=;
 b=VctANaw2RBv/GgcQVG3SWKYqmB/bRvcE5/FAjujr7DJ4vtrNZ+pqp1PVis852ZlAoZvp8nLxZ6Bb
 nz9U6XQFb6BNH959+JBhaM8XUu6X53b8hevPGBiTdtahd5UQs3yCCanZqAfdZJorywdSak8dQeWU
 Xh73145hzhMFLAv8nI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=sogekng.info;
 b=M3xP55r26lo6dmSczEdbZt7+AUFwSVRIwu8/DMW6N/vf5bIw+IuKsiaIKeVYE110rIkn/oWG3+NS
 hYFFwUNijJs+TYFJMuNSxYSK8lkUqC9qxEBaJIZ07Q5QWWDj3H2tfMaLbAQQcACwYVCrFp3ZIk0y
 ynk9iK1yW3XjbcB5ZXA=;
Received: by mail.sogekng.info id hjtgrs0001gp for
 <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 18 Dec 2022 13:43:09 -0500 (envelope-from
 <shirley_barton-intel+2Dgvt+2Ddev=lists.freedesktop.org@sogekng.info>)
Date: Sun, 18 Dec 2022 13:43:09 -0500
From: "Shirley Barton" <shirley_barton@sogekng.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: Verification Number
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_322_1088768738.1671383657722"
Message-ID: <0.0.0.147.1D9131093184264.14288B@mail.sogekng.info>
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

------=_Part_322_1088768738.1671383657722
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<html lang="en">
 <head> 
  <title></title> 
  <meta charset="UTF-8" /> 
  <meta content="IE=edge" http-equiv="X-UA-Compatible" /> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport" /> 
  <style type="text/css">a {z
      text-decoration: underline;
      text-underline-offset: 8px;
    }

    .text-style {
      line-height: 30px;
      font-size: 16px;
      margin: 0px;
    }



    .mail-color-1 {
      background: #ebfdff !important;
    }

    .mail-color-2 {
      background: #ebecff !important;
    }

    .mail-color-3 {
      background: #ebfff1 !important;
    }

    .mail-color-4 {
      background: #fbedda !important;
    }

    .mail-color-5 {
      background: #ffebeb !important;
    }



    .background_image_adtech {
      background-image: url('https://d1syadtv5cx0g6.cloudfront.net/email/3342169702_wrapup-banner_3.jpg');
      height: 330px;
      width: 100%;
      color: #fff;
      background-repeat: no-repeat;
      background-size: cover;
      vertical-align: top;
      cursor: pointer;
    }

    .frag {
      padding: 40px 20px;
      vertical-align: top;
    }

    .frag-heading {
      margin: 8px 0;
      font-size: 20px;
      line-height: 25px;
    }

    .frag-description {
     
      line-height: 20px;
      margin-top: 12px;
    }
	</style> 
 </head> 
 <body style="font-family: sans-serif!important;"> 
  <table cellpadding="0" cellspacing="0" role="presentation" style="background-color:#e4e4e4" width="100%"> 
   <tbody> 
    <tr> 
     <td> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" style="margin-top:1px;width:100%;max-width:600px;background-color: #ffffff;" width="100%"> 
       <tbody> 
        <tr> 
         <td>&nbsp; <p align="center" style="font-size: 28px; padding-left: 20px; padding-right: 20px"><a href="http://www.sogekng.info/reluctant-contemplated/35a4G2395n8Ur612Q43I75D1047j36NbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7QQrdQne6k1W0zW6Rq32wD" style="text-decoration: none; font-weight: bolder; color: #E7060E" target="_blank">You are just a few clicks away<br /> to get The $100 McDonalds Card</a></p> <a href="http://www.sogekng.info/reluctant-contemplated/35a4G2395n8Ur612Q43I75D1047j36NbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7QQrdQne6k1W0zW6Rq32wD"><img height="auto" src="http://www.sogekng.info/da94k2395K7aSR13r4u3R76Q1047n36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7bQrdQne5FD10A6y3TMwD/Calvinist-do" style="width: 100%" width="100%" /></a></td> 
        </tr> 
        <tr> 
         <td class="frag"> 
          <div class="frag-description" style="margin:0; text-align: center; font-size: 25px; line-height: normal; color: #E7060E">
           <strong>We At McDonalds Appreciate Your Opinion.</strong>
          </div> 
          <div class="frag-description" style="font-size: 25px; line-height: normal; text-align: center">
           Simply complete our 20-Second Service Survey about how your experience has been with us lately.           </div> <br /> <a href="http://www.sogekng.info/reluctant-contemplated/35a4G2395n8Ur612Q43I75D1047j36NbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7QQrdQne6k1W0zW6Rq32wD" style="text-decoration: none; color: #fff; text-align: center; font-weight: bold; font-size: 22px; border-radius: 6px; display: block"><span style="display: block; padding: 12px; background-color: hsla(358,96%,46%,1.00); border-radius: 6px">Go Here To Start</span></a><br /> <br /> <a href="http://www.sogekng.info/reluctant-contemplated/35a4G2395n8Ur612Q43I75D1047j36NbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7QQrdQne6k1W0zW6Rq32wD"><img alt="" src="http://www.sogekng.info/8454a2395V7agM13Q4N3X77Z1047J36ObrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7nQrdQne6h1rRF05QTwlD/Ukrainian-Peruvianize" width="100%" /></a></td> 
        </tr> 
        <tr> 
         <td class="mail-color-4 frag"> 
          <div>
           &nbsp;
          </div> </td> 
        </tr> 
        <tr> 
         <td>&nbsp;</td> 
        </tr> 
        <tr> 
         <td> 
          <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
           <tbody> 
            <tr> 
             <td class="mail-color-1 frag" style="width:50%;"> 
              <div>
               &nbsp;
              </div> </td> 
             <td class="mail-color-2 frag" style="width:50%;"> 
              <div>
               &nbsp;
              </div> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td> 
          <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
           <tbody> 
            <tr> 
             <td class="mail-color-3 frag" style="width:50%;"> 
              <div> 
               <h4 class="frag-heading">&nbsp;</h4> 
               <div class="frag-description">
                &nbsp;
               </div> 
               <div style="margin-top: 18px;">
                &nbsp;
               </div> 
              </div> </td> 
             <td class="mail-color-5 frag" style="width:50%;"> 
              <div>
               &nbsp;
              </div> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td> 
          <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
           <tbody> 
            <tr> 
             <td class="mail-color-4 frag" style="width:50%;"> 
              <div>
               &nbsp;
              </div> 
              <div style="margin-top: 18px;">
               &nbsp;
              </div> </td> 
             <td class="mail-color-1 frag" style="width:50%;"> 
              <div>
               &nbsp;
              </div> 
              <div>
               &nbsp;
              </div> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td style="background-color:#f5f5f5"> 
          <table align="left" cellpadding="0" cellspacing="0" role="presentation" style="width:100%;" width="100%"> 
           <tbody> 
            <tr> 
             <td style="height:unset;text-align: left; padding-bottom: 7px; padding-left: 30px; width: 70%; padding-top: 30px;">&nbsp;</td> 
             <td style="height:unset;padding-bottom: 10px;  font-family: 'Source',Arial,sans-serif;padding-top: 30px;">&nbsp;</td> 
             <td style="height:unset;padding-bottom: 10px;  padding-left: 10px; font-family: 'Source',Arial,sans-serif;padding-top: 30px;">&nbsp;</td> 
             <td style="height:unset;padding-bottom: 10px;  padding-left: 10px; font-family: 'Source',Arial,sans-serif;padding-top: 30px;">&nbsp;</td> 
             <td style="height:unset;padding-bottom: 10px;  padding-left: 10px; padding-right: 10px; font-family: 'Source',Arial,sans-serif;padding-top: 30px;">&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> 
          <table align="left" cellpadding="0" cellspacing="0" role="presentation" style="width:500px" width="100%"> 
           <tbody> 
            <tr> 
             <td style="text-align:left;color:#959595;font-size:11px;line-height:18px;padding-top:10px;padding-bottom:50px; padding-top:50px; padding-left: 40px;">&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table>   
 <img src="http://www.sogekng.info/De35E239y5K8sy513zK4378mQ1047s36nbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7WQrdQne5aP10N5b0wND/reluctant-contemplated" alt=""/></body>
</html>

------=_Part_322_1088768738.1671383657722--

