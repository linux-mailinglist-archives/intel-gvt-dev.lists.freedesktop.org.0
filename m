Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5D66A014
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Jan 2023 18:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885B010EA86;
	Fri, 13 Jan 2023 17:20:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 13 Jan 2023 17:20:37 UTC
Received: from mail.shp-verzon.info (unknown [45.13.189.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDA3D10EA7C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Jan 2023 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=shp-verzon.info; 
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=verizon-appreciation@shp-verzon.info; 
 bh=Gqgu6m2dLSU/N5v1ODYRiZ4qUwY=;
 b=KhHQUDXqErFAaHkB4J50CVOc2TJy5Qr76MFYWH2TeyiLWQjCo5pTMz8eFxQGQQXXhIIKDG29v82J
 csmI8R3Wu8cv68PvFExUXsNP6iMzYg4/Sbg9hUcYos6v+3ozho37Rv1FBwpTWHwSNqaOSPT1uObD
 Qj5BY00IrG4BhvLp6CM=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=shp-verzon.info;
 b=fuAdl4OXhq9aJ7eHzO3x8WLd+EUiU/xFy/uAOLlbXBqeY9TRRb/k+2ToiL1kkqrpRZ7OTUfxDIuv
 tPEpJAMrlaxe/inuzEAyc4HCKveGB7LepEs2EmyM2eWzqG+o2j7gYOAF9hk8WNhFZqLtFlFFXij3
 LYKW6qgSGnPDu3CYe3o=;
Received: by mail.shp-verzon.info id ho69ec0001gl for
 <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Jan 2023 12:08:20 -0500 (envelope-from
 <verizon-appreciation-intel+2Dgvt+2Ddev=lists.freedesktop.org@shp-verzon.info>)
Date: Fri, 13 Jan 2023 12:08:20 -0500
From: "VERIZON Appreciation" <verizon-appreciation@shp-verzon.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: We have some exciting news for you
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_571_1419656576.1673629679557"
Message-ID: <0.0.0.3F.1D92771A2F9A77A.36F571@mail.shp-verzon.info>
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

------=_Part_571_1419656576.1673629679557
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
 <head> 
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport" /> 
  <link href="http://www.shp-verzon.info/8db5mG2395DG86s11a4647V10cbB36LbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7LQWdRRn6X1kH0_6bPJqwD/aboveboard-Dunkirk" rel="stylesheet" type="text/css" /> 
  <title>gate opned</title> 
  <style type="text/css">div,
    p,
    a,
    li,
    td {
      -webkit-text-size-adjust: none
    }

    .ReadMsgBody {
      width: 100%; 
      background-color: #cecece
    }

    .ExternalClass {
      width: 100%; 
      background-color: #cecece
    }

    body {
      width: 100%; 
      height: 100%; 
      background-color: #cecece; 
      margin: 0; 
      padding: 0; 
      -webkit-font-smoothing: antialiased
    }

    html {
      width: 100%
    }

    img {
      border: none
    }

    table td.show {
      display: none !important
    }

    @media only screen and (max-width:640px) {
      table.full {
        width: 100% !important
      }
      table.devicewidth {
        width: 100% !important; 
        padding-left: 20px !important; 
        padding-right: 20px !important
      }
      table.inner {
        width: 100% !important; 
        text-align: center !important; 
        clear: both
      }
      table.inner-centerd {
        width: 78% !important; 
        text-align: center !important; 
        clear: both; 
        float: none !important; 
        margin: 0 auto !important
      }
      table td.hide,
      .hide {
        display: none !important
      }
      table td.show,
      .show {
        display: block !important
      }
      img.responsiveimg {
        width: 100% !important; 
        height: atuo !important; 
        display: block !important
      }
      table.btnalign {
        float: left !important
      }
      table.btnaligncenter {
        float: none !important; 
        margin: 0 auto !important
      }
      table td.textalignleft {
        text-align: left !important; 
        padding: 0 !important
      }
      table td.textaligcenter {
        text-align: center !important
      }
      table td.heightsmalldevices {
        height: 45px !important
      }
      table td.heightSDBottom {
        height: 28px !important
      }
      table.adjustblock {
        width: 87% !important
      }
      table.resizeblock {
        width: 92% !important
      }
      table td.smallfont {
        font-size: 8px !important
      }
    }

    @media only screen and (max-width:520px) {
      table td.heading {
        font-size: 24px !important
      }
      table td.heading01 {
        font-size: 18px !important
      }
      table td.heading02 {
        font-size: 27px !important
      }
      table td.text01 {
        font-size: 22px !important
      }
      table.full.mhide,
      table tr.mhide {
        display: none !important
      }
    }

    @media only screen and (max-width:480px) {
      table {
        border-collapse: collapse
      }
      table#colaps-inhiret01,
      table#colaps-inhiret02,
      table#colaps-inhiret03,
      table#colaps-inhiret04,
      table#colaps-inhiret05,
      table#colaps-inhiret06,
      table#colaps-inhiret07,
      table#colaps-inhiret08,
      table#colaps-inhiret09 {
        border-collapse: inherit !important
      }
    }
	</style> 
 </head> 
 <body>
  &nbsp; 
  <table align="center" border="0" cellpadding="0" cellspacing="0" class="full" width="100%" zp-module="noshow" zp-sortable="true"> 
   <tbody> 
    <tr> 
     <td align="center"> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" class="devicewidth" width="600"> 
       <tbody> 
        <tr> 
         <td> 
          <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" class="full" style="background-color:#ffffff; border-radius:5px 5px 0 0; " width="100%" zp-bg-color="Module-Background"> 
           <tbody> 
            <tr> 
             <td> 
              <table align="left" border="0" cellpadding="0" cellspacing="0" class="inner" style="text-align:center; " width="265"> 
               <tbody> 
                <tr> 
                 <td height="52">&nbsp; </td> 
                </tr> 
                <tr> 
                 <td align="center" style="font:700 37px 'Montserrat', Helvetica, Arial, sans-serif; color:#000; text-transform:uppercase" valign="middle"><a href="http://www.shp-verzon.info/5b14L2395OT8u612r4t648s10cbl36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdRRn5K1o0z5qzWwD/source-disputes" style="text-decoration: none; color: #000"><span style="display: inline-block; font-size: 49px; color:#EE0000 ">V</span>erizon </a></td> 
                </tr> 
                <tr> 
                </tr> 
               </tbody> 
              </table> 
              <table align="right" border="0" cellpadding="0" cellspacing="0" class="inner" style="text-align:center; " width="255"> 
               <tbody> 
                <tr> 
                 <td class="hide" height="22">&nbsp; </td> 
                </tr> 
                <tr> 
                 <td height="10">&nbsp; </td> 
                </tr> 
                <tr> 
                 <td align="center" valign="middle"> 
                  <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="191"> 
                   <tbody> 
                    <tr> 
                     <td align="center" bgcolor="#000" height="57" style="border-radius:28px; " zp-bg-color="Button"><a href="http://www.shp-verzon.info/5b14L2395OT8u612r4t648s10cbl36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdRRn5K1o0z5qzWwD/source-disputes" style="font:700 14px/57px 'Montserrat', Helvetica, Arial, sans-serif; color:#ffffff; text-decoration:none; text-transform:uppercase; display:block; overflow:hidden; " zp-editable="" zp-font-color="Button" zp-font-size="Button">GO TO VERIZON APP</a></td> 
                    </tr> 
                   </tbody> 
                  </table> </td> 
                </tr> 
                <tr> 
                 <td height="40">&nbsp; </td> 
                </tr> 
               </tbody> 
              </table> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table> 
  <table align="center" border="0" cellpadding="0" cellspacing="0" class="full" width="100%" zp-module="Features" zp-sortable="true"> 
   <tbody> 
    <tr> 
     <td align="center"> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" class="devicewidth" width="600"> 
       <tbody> 
        <tr> 
         <td> 
          <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" class="full" style="text-align:center; border-bottom:1px solid #e5e5e5; " width="100%" zp-bg-color="Module-Background"> 
           <tbody> 
            <tr> 
             <td> 
              <table align="center" border="0" cellpadding="0" cellspacing="0" style="text-align:center; " width="100%"> 
               <tbody> 
                <tr> 
                 <td class="heading" style="font:500 23px 'Montserrat', Helvetica, Arial, sans-serif; color:#000; "><br /> <font zp-editable="" zp-font-color="Heading-1" zp-font-size="Heading-1">Get just a few clicks away from The <b>$100 Verizon Card</b>, by completing our 20-Second Service Survey about your recent experience with us.</font> <a href="http://www.shp-verzon.info/5b14L2395OT8u612r4t648s10cbl36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdRRn5K1o0z5qzWwD/source-disputes"><img alt="" src="http://www.shp-verzon.info/apiaries-plaintive/a446D23Dx95u7aJL11S464au10cbA36hbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7MQWdRRn5So1y06JNLpwD" style="display: block; margin: auto" width="90%" /></a> <font zp-editable="" zp-font-color="Heading-1" zp-font-size="Heading-1"> Your input is important to us and will help us improve our stores and the products and services we offer</font><br /> &nbsp; 
                  <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="292"> 
                   <tbody> 
                    <tr> 
                     <td align="center" bgcolor="#000" height="61" style="border-radius:28px; " zp-bg-color="Button"><a href="http://www.shp-verzon.info/5b14L2395OT8u612r4t648s10cbl36zbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7pQWdRRn5K1o0z5qzWwD/source-disputes" style="font:700 16px/61px 'Montserrat', Helvetica, Arial, sans-serif; color:#ffffff; text-decoration:none; text-transform:uppercase; display:block; overflow:hidden; outline:none; " zp-editable="" zp-font-color="Button" zp-font-size="Button">Go Here To Start</a></td> 
                    </tr> 
                   </tbody> 
                  </table> </td> 
                </tr> 
                <tr> 
                 <td class="heightSDBottom" height="47">&nbsp; </td> 
                </tr> 
                <tr> 
                 <td> 
                  <table align="center" border="0" cellpadding="0" cellspacing="0" class="adjustblock" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; " width="100%"> 
                   <tbody> 
                    <tr> 
                     <td> 
                      <table bgcolor="#EE0000" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="100%" zp-bg-color="Title-Background"> 
                       <tbody> 
                        <tr> 
                         <td height="56">&nbsp; </td> 
                        </tr> 
                        <tr> 
                         <td class="text01" style="font:700 26px 'Montserrat', Helvetica, Arial, sans-serif; color:#ffffff; text-transform:uppercase; padding:0 5% 0 5%; "><font zp-editable="" zp-font-color="Heading-2" zp-font-size="Heading-2">Your Opinion Matters </font></td> 
                        </tr> 
                        <tr> 
                         <td height="56">&nbsp; </td> 
                        </tr> 
                        <tr> 
                         <td> 
                          <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; border:1px solid #EE0000; " width="100%" zp-bg-color="Module-Background"> 
                           <tbody> 
                            <tr> 
                             <td bgcolor="#f8f8f8" height="25" zp-bg-color="Sub-Title">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td bgcolor="#f8f8f8" style="font:26px Arial, Helvetica, sans-serif; color:#3a3a3a; " zp-bg-color="Sub-Title">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td bgcolor="#f8f8f8" height="25" zp-bg-color="Sub-Title">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td height="25">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td style="font:bold 16px Arial, Helvetica, sans-serif; color:#4a4a4a; padding:0 5% 0 5%; ">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td height="25">&nbsp; </td> 
                            </tr> 
                            <tr> 
                             <td> 
                              <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; " width="100%"> 
                               <tbody> 
                                <tr> 
                                 <td> 
                                  <table align="left" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="195"> 
                                   <tbody> 
                                    <tr> 
                                     <td width="20">&nbsp; </td> 
                                     <td> 
                                      <table align="center" border="0" cellpadding="0" cellspacing="0" class="whuusblock02" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="100%"> 
                                       <tbody> 
                                        <tr> 
                                         <td height="21">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td align="center"> 
                                          <table align="center" bgcolor="#fff" border="0" cellpadding="0" cellspacing="0" class="btnalign" height="57" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; border-radius:28px; " width="57" zp-bg-color="Numbers-Background"> 
                                           <tbody> 
                                            <tr> 
                                             <td height="57" style="font:bold 12px Arial, Helvetica, sans-serif; color:#ffffff; ">&nbsp; </td> 
                                            </tr> 
                                           </tbody> 
                                          </table> </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="30">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:700 14px 'Montserrat', Helvetica, Arial, sans-serif; color:#4e4e4e; text-transform:uppercase; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:15px/22px Arial, Helvetica, sans-serif; color:#4a4a4a; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                       </tbody> 
                                      </table> </td> 
                                     <td width="16">&nbsp; </td> 
                                    </tr> 
                                   </tbody> 
                                  </table> 
                                  <table align="left" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="195"> 
                                   <tbody> 
                                    <tr> 
                                     <td width="20">&nbsp; </td> 
                                     <td> 
                                      <table align="center" border="0" cellpadding="0" cellspacing="0" class="whuusblock02" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="100%"> 
                                       <tbody> 
                                        <tr> 
                                         <td height="21">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td align="center"> 
                                          <table align="center" bgcolor="#fff" border="0" cellpadding="0" cellspacing="0" class="btnalign" height="57" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; border-radius:28px; " width="57" zp-bg-color="Numbers-Background"> 
                                           <tbody> 
                                            <tr> 
                                             <td height="57" style="font:bold 12px Arial, Helvetica, sans-serif; color:#ffffff; ">&nbsp; </td> 
                                            </tr> 
                                           </tbody> 
                                          </table> </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="30">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:700 14px 'Montserrat', Helvetica, Arial, sans-serif; color:#4e4e4e; text-transform:uppercase; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:15px/22px Arial, Helvetica, sans-serif; color:#4a4a4a; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                       </tbody> 
                                      </table> </td> 
                                     <td width="16">&nbsp; </td> 
                                    </tr> 
                                   </tbody> 
                                  </table> 
                                  <table align="left" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="195"> 
                                   <tbody> 
                                    <tr> 
                                     <td width="20">&nbsp; </td> 
                                     <td> 
                                      <table align="center" border="0" cellpadding="0" cellspacing="0" class="whuusblock02" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="100%"> 
                                       <tbody> 
                                        <tr> 
                                         <td height="21">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td align="center"> 
                                          <table align="center" bgcolor="#fff" border="0" cellpadding="0" cellspacing="0" class="btnalign" height="57" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; border-radius:28px; " width="57" zp-bg-color="Numbers-Background"> 
                                           <tbody> 
                                            <tr> 
                                             <td height="57" style="font:bold 12px Arial, Helvetica, sans-serif; color:#ffffff; ">&nbsp; </td> 
                                            </tr> 
                                           </tbody> 
                                          </table> </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="30">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:700 14px 'Montserrat', Helvetica, Arial, sans-serif; color:#4e4e4e; text-transform:uppercase; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td class="textalignleft" style="font:15px/22px Arial, Helvetica, sans-serif; color:#4a4a4a; ">&nbsp; </td> 
                                        </tr> 
                                        <tr> 
                                         <td height="20">&nbsp; </td> 
                                        </tr> 
                                       </tbody> 
                                      </table> </td> 
                                     <td width="16">&nbsp; </td> 
                                    </tr> 
                                   </tbody> 
                                  </table> </td> 
                                </tr> 
                               </tbody> 
                              </table> </td> 
                            </tr> 
                           </tbody> 
                          </table> </td> 
                        </tr> 
                       </tbody> 
                      </table> </td> 
                    </tr> 
                   </tbody> 
                  </table> </td> 
                </tr> 
                <tr> 
                 <td class="heightsmalldevices" height="89">&nbsp; </td> 
                </tr> 
               </tbody> 
              </table> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table> 
  <table align="center" border="0" cellpadding="0" cellspacing="0" class="full" width="100%" zp-module="noshow" zp-sortable="true"> 
   <tbody> 
    <tr> 
     <td align="center"> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" class="devicewidth" width="600"> 
       <tbody> 
        <tr> 
         <td> 
          <table align="center" bgcolor="#000" border="0" cellpadding="0" cellspacing="0" class="full" style="border-radius:0 0 5px 5px; " width="100%" zp-bg-color="Module-Background"> 
           <tbody> 
            <tr> 
             <td height="18">&nbsp; </td> 
            </tr> 
            <tr> 
             <td> 
              <table align="right" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="340"> 
               <tbody> 
                <tr> 
                 <td width="21">&nbsp; </td> 
                 <td> 
                  <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
                   <tbody> 
                    <tr> 
                     <td> 
                      <table align="center" border="0" cellpadding="0" cellspacing="0" class="full" width="100%"> 
                       <tbody> 
                        <tr> 
                         <td align="center" style="font:11px Helvetica,  Arial, sans-serif; color:#383838; ">&nbsp; </td> 
                         <td style="color:#ffffff; ">&nbsp; </td> 
                         <td align="center" style="font:11px Helvetica,  Arial, sans-serif; color:#383838; ">&nbsp; </td> 
                         <td style="color:#ffffff; ">&nbsp; </td> 
                         <td align="center" style="font:11px Helvetica,  Arial, sans-serif; color:#383838; ">&nbsp; </td> 
                         <td align="right" class="hide" width="40">&nbsp; </td> 
                        </tr> 
                        <tr> 
                         <td height="18">&nbsp; </td> 
                        </tr> 
                       </tbody> 
                      </table> </td> 
                    </tr> 
                   </tbody> 
                  </table> </td> 
                </tr> 
               </tbody> 
              </table> 
              <table align="left" border="0" cellpadding="0" cellspacing="0" class="inner" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; text-align:center; " width="230"> 
               <tbody> 
                <tr> 
                 <td width="21">&nbsp; </td> 
                 <td> 
                  <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
                   <tbody> 
                    <tr> 
                     <td align="center" style="font:11px Helvetica,  Arial, sans-serif; color:#ffffff; ">&nbsp; </td> 
                    </tr> 
                    <tr> 
                     <td height="18">&nbsp; </td> 
                    </tr> 
                   </tbody> 
                  </table> </td> 
                 <td width="21">&nbsp; </td> 
                </tr> 
               </tbody> 
              </table> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr class="mhide"> 
         <td align="center" height="100"><br /> <br /> To quit notifications,<a href="http://www.shp-verzon.info/a074E2395Bj86q13y464RS9H10cbr36HbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7hQWdRRn6LWYZ106rOTwpD/vulnerability-slippage" style="text-decoration-line: none; "> <span>Go.Ahead.Here </span> </a><br /> 126 E 23rd St New York, NY, US 10010<br /> <br /> <br /> <br /> <font color="disjunctive"></font><span style="ciphertexts"></span><span dir="partakes"><font lang="Isaiah"></font></span><font style="futuristic"></font><font></font></td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table> 
  <br /> &nbsp;   
 <img src="http://www.shp-verzon.info/1976t239_P5po85L13NhW464bz10cbM36mbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7QQWdRRn6jr1G0K5VqwlD/aboveboard-Dunkirk" alt=""/></body>
</html>

------=_Part_571_1419656576.1673629679557--

