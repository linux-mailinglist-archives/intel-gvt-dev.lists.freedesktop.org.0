Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FE58BAD8
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  7 Aug 2022 14:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB375B74D3;
	Sun,  7 Aug 2022 12:26:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 19529 seconds by postgrey-1.36 at gabe;
 Sun, 07 Aug 2022 12:01:26 UTC
Received: from imsantv71.netvigator.com (imsantv71.netvigator.com
 [210.87.250.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93326A51A8;
 Sun,  7 Aug 2022 12:01:10 +0000 (UTC)
Received: from ybironout4d.netvigator.com (ybironout4d.netvigator.com
 [210.87.250.43])
 by imsantv71.netvigator.com (8.14.7/8.14.4) with ESMTP id 2776WMZw012516;
 Sun, 7 Aug 2022 14:32:22 +0800
X-IPAS-Result: =?us-ascii?q?A0D//wDlW+9i//oUeHBagRKBSDwDARKDFQo0EhyBFoJki?=
 =?us-ascii?q?GyCOQ2CUYtBgSKCXIg6BAGCQAECEYYxgXsLAQEBIQEsAQIEAQGBRINiBYRXA?=
 =?us-ascii?q?RQRSwEGAQEBAQMCAwEBAQEBAQMCBQMCAQcEgQkThXVAARAFAYVjAxAEAQEDF?=
 =?us-ascii?q?wIPAiABBScCCAIBBgEGAw4GIhcBBBEJEyoKAQICAUqBTQICCEuCbAEBAjICB?=
 =?us-ascii?q?gGqC4EwGmeEW4IpBR8Ig2OHCEeXcxIBKIIpiDeEZIsPBFIDCQQHBRsRIwsnD?=
 =?us-ascii?q?jMPFINugRQXNoMbg22CA1+BaURjg0MZgRGBfYFWgWkHCYFCHT0Pmwt/MoFLA?=
 =?us-ascii?q?QEBhjSKeSGBOY4ZYp4PNgEGAgKDKxoMigSaQoxEhkgDkWK5G22DQYMeDoFZc?=
 =?us-ascii?q?IFuCYF/Ep04JIEECYViCBIBCgGDR4FCg3YB?=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:dBMxQ64GmrTlpIBn3wPXwN3XdLJyesId70hD6qkXc31om62j+f
 xG88526faZslwssRIb9uxoUZPoKU80k6Qf3WB7B9qftXPdyQiVxflZnOnfKmHbakjDH5VmtZ
 tdTw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,219,1654531200"; 
 d="scan'208,217";a="292658120"
Message-Id: <d9181c$8n36u8@ybironout4v1.netvigator.com>
Received: from unknown (HELO User) ([112.120.20.250])
 by ybironout4v1.netvigator.com with SMTP; 07 Aug 2022 14:32:08 +0800
From: "Nikki Fenton"<nikkifen19075@netvigator.com>
Subject: Please Reply For More Details.
Date: Sat, 6 Aug 2022 23:32:22 -0700
MIME-Version: 1.0
Content-Type: text/html;
	charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 1
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
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
Reply-To: nikkifenton@citromail.hu
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<HTML><HEAD><TITLE></TITLE>
</HEAD>
<BODY bgcolor=#FFFFFF leftmargin=5 topmargin=5 rightmargin=5 bottommargin=5>
<FONT size=2 color=#000000 face="Arial">
<DIV>
Hello,</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
I viewed your profile on Linkedin regarding a proposal that has something in common with you, reply for more details via: nikkifenton@citromail.hu</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
<B>Nikki Fenton</B></DIV>
</FONT>
</BODY></HTML>
