Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DF1F5269
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 10 Jun 2020 12:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7939F6E524;
	Wed, 10 Jun 2020 10:35:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 110704 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jun 2020 10:35:46 UTC
Received: from send67.postman.co.kr (send67.postman.co.kr [119.207.76.67])
 by gabe.freedesktop.org (Postfix) with SMTP id B61606E524
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 10 Jun 2020 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1591785236; 
 s=sender; d=postman.co.kr;
 h=From:To:Reply-to:Subject:Date:List-Unsubscribe:Feedback-Id:Precedence:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=bavQN/JiFYmdBHz7VXJgU5H62CEr+ve/JO0q+qJW4BY=;
 b=fax3QduWuhi+n0WuDBIiCqwUdWHTQqbzOS8oqX1d3/tC4Uzffvnk1bZq73do6zpG
 fPlnfpEraTtnmhdFlXr30l6GoIGGhsRxtLBE3paw9VMNqMmZgsuPzOPI7s1IEvYSsbM
 XdnLP1eN5seY6yIKOZpFF2Yl9CmzsBh3jdd0h8c4=
From: "=?utf-8?B?YmVsbGEtc3V2?=" <bella@suvelectronics.com>
To: "=?utf-8?B?Q1VTVA==?=" <intel-gvt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6WEM2U0xYMjUtMkNTRzMyNEPCoDEyNlBDUy9iYWfCoFhJTElOWA==?=
Date: Wed, 10 Jun 2020 19:33:56 +0900
X-WORKER_ID: <single.default_Worker_12>
X-MAIL_ID: <UE9TVF9JRD0yMDIwMDYxMDAwMDM2>
X-MEMBER_ID: <TV9JRD1pbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw==>
X-SEND_TYPE: <U1RZUEU9TUFTUw==>
X-LIST_TABLE: <TElTVF9UQUJMRT1FTVNfTUFTU19TRU5EX0xJU1Q=>
Feedback-Id: 236232122@qq.com﻿:2020061000036:intel-gvt-dev@lists.freedesktop.org:ums
Precedence: bulk
X-Mailer: eMsSMTP Ver6.5( PLUTO-build 0322 )
MIME-Version: 1.0
Message-ID: <202006101933567138@send67.postman.co.kr>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: bella@suvelectronics.com
Content-Type: multipart/mixed; boundary="===============0739522902=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0739522902==
Content-Type: text/html; 	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<title></title>
</head>
<body><div style=3D"display:none"><img src=3D"http://ums.pushpia.cn/Check.html?TV9JRD1pbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw=3D=3D&U1RZUEU9TUFTUw=3D=3D&TElTVF9UQUJMRT1FTVNfTUFTU19TRU5EX0xJU1Q=3D&UE9TVF9JRD0yMDIwMDYxMDAwMDM2&VEM9MjAyMDA3MTA=3D&S0lORD1P" width=3D1 height=3D1></div>
<div id=3D"ums_header" style=3D"text-align:center; margin-bottom: 10px;">
<p align=3D"CENTER">If you do not want to continue to receive mail, please click here<a href=3D"http://ums.pushpia.cn/Check.html?TV9JRD1pbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw=3D=3D&U1RZUEU9TUFTUw=3D=3D&TElTVF9UQUJMRT1FTVNfTUFTU19TRU5EX0xJU1Q=3D&UE9TVF9JRD0yMDIwMDYxMDAwMDM2&VEM9MjAyMDA3MTA=3D&S0lORD1D&Q0lEPTAwMQ=3D=3D&URL=3Dhttp://ums.pushpia.cn/ums/deny/unsubscription_en.jsp?p_id=3D2020061000036&amp;m_id=3Dintel-gvt-dev@lists.freedesktop.org&amp;chn=3Dem">Unsubscribe</a>.</p>
</div>
<pre>
<bgsound id=3D"_BGSOUND" loop=3D"infinite" src=3D""></bgsound></pre>
<div>
<div>
<div>
<div>
<p>Dear&nbsp;Valued customer,</p>
<p>Good day to you!</p>
<p>How are you?</p>
<p>Do you have any inquiry i could help?</p>
<p><em><strong><u>IC:</u></strong></em> Xilinx, Altera, AD, TI, Maxim, etc.<br />
<em><u><strong>Diode/Transistor:</strong></u></em> NXP, DIODES, AD, ST, Vishay, etc.<br />
<u><strong><em>Capacitor&amp;Resistor</em></strong>:</u> SAMSUNG, YAGEO, MURATA, Kemet, AVX, Taiyo, Vishay, TDK, MAXIN, etc.</p>
<p>Here are some<strong> Hot offers</strong> for reference:<br />
STM32F030RCT6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;1.28usd<br />
STM32F401RCT6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;&nbsp;1.37usd<br />
STM32F303RCT6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;&nbsp;1.85usd<br />
STM32F103RET6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;1.87usd<br />
STM32F030R8T6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;0.7usd<br />
STM32F030F4P6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;0.7usd<br />
STM32F103CBT6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;1.67usd<br />
STM32F427VGT6&nbsp;1000pcs&nbsp;ST&nbsp;2019+&nbsp;5.0usd<br />
&nbsp;<br />
LM2596S-5.0&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.52usd<br />
LM2596T-12&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.9usd<br />
LM2594M-12&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-ADJ&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-ADJ&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-5.0&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-3.3&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-5.0&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd<br />
LM2594M-3.3&nbsp;1000pcs&nbsp;TI&nbsp;2019+&nbsp;0.64usd</p>
<p></p>
<p>XC6SLX16-2CSG324C&nbsp;126PCS/bag XILINX&nbsp;2019+&nbsp;3.375USD&nbsp;<br />
XC6SLX25-2CSG324C&nbsp;126PCS/bag&nbsp;XILINX&nbsp;2019+&nbsp;&nbsp;10.74USD<br />
XC6SLX25-2CSG324I&nbsp;126PCS/bag&nbsp;XILINX&nbsp;2019+&nbsp;13.5USD&nbsp;<br />
XC6SLX45-2FGG484C&nbsp;60PCS/tray&nbsp;XILINX&nbsp;2019+&nbsp;15.56USD<br />
XC7Z020-1CLG484I&nbsp;84PCS/tray&nbsp; XILINX&nbsp;2019+&nbsp;32.59USD</p>
<p></p>
<p><strong>Our service: Quality Electronic Components Supplies</strong></p>
<p>1. Competitive price with short lead time(1-3days).<br />
2. 1 year Warranty.<br />
3. Free samples<br />
4. PCB &amp; SMT and BOM service.<br />
5. Hard to find, Obsolete and shortage parts.</p>
</div>
<p>Enjoy your life and have a nice day !</p>
</div>
<p>Best Regards !</p>
<p>________________________________________________________________________________________________________________________</p>
<p><strong>Bella</strong></p>
<p>Sales</p>
<div><strong>Main brands:</strong> TI, FAIRCHILD, ALTERA, MICROCHIP, VISHAY,ETC.&nbsp;</div>
<div><strong><em>SUVSystem Ltd.</em></strong></div>
<p>6A,Guoyi Building,Longhe Road,Longgang Dis,Shenzhen,CN,518000</p>
<p><strong>Tel</strong>: +86-755-89231323</p>
<p><strong>Skype</strong>: <a>Bella@suvsystem.com</a></p>
<p align=3D"left"></p>
<p align=3D"left"></p>
</div>
</div>
<div id=3D"ums_footer" style=3D"text-align:center; margin-top: 10px;">
<p align=3D"CENTER">If you do not want to continue to receive mail, please click here<a href=3D"http://ums.pushpia.cn/Check.html?TV9JRD1pbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw=3D=3D&U1RZUEU9TUFTUw=3D=3D&TElTVF9UQUJMRT1FTVNfTUFTU19TRU5EX0xJU1Q=3D&UE9TVF9JRD0yMDIwMDYxMDAwMDM2&VEM9MjAyMDA3MTA=3D&S0lORD1D&Q0lEPTAwMg=3D=3D&URL=3Dhttp://ums.pushpia.cn/ums/deny/unsubscription_en.jsp?p_id=3D2020061000036&amp;m_id=3Dintel-gvt-dev@lists.freedesktop.org&amp;chn=3Dem">Unsubscribe</a>.</p>
</div>
</body>
</html>


--===============0739522902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0739522902==--
