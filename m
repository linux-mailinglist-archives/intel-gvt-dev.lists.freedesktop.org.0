Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5E784D9B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Aug 2023 02:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E7910E0A6;
	Wed, 23 Aug 2023 00:05:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 23 Aug 2023 00:05:42 UTC
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk
 [203.124.41.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C375910E0A6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Aug 2023 00:05:42 +0000 (UTC)
X-AuditID: cb7c291e-055ff70000002aeb-e0-64e534d9fec7
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com
 [210.56.28.11])
 (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id
 77.DB.10987.AD435E46; Wed, 23 Aug 2023 03:21:14 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; d=iesco.com.pk; s=default;
 h=received:content-type:mime-version:content-transfer-encoding
 :content-description:subject:to:from:date:reply-to;
 b=QzOWpZjxM9LYY7kdT/3Fuf7F7OdRpKJCALj6/lXX0d1Ra+Qde38fq7hNAxCfUWIMG
 d4gt6BGNi0KtOAVDsGUI5IKE/ADsdxz5zzbQCK0aHeZNQfeaTLIOXV+4o97tImDIn
 J14leyxgfXMq6TbDSyGtLBM8vKkhuxxiyfSFsGK2k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iesco.com.pk; s=default;
 h=reply-to:date:from:to:subject:content-description
 :content-transfer-encoding:mime-version:content-type;
 bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
 b=GGQi3FAM3AYTlSSaHF8waErS2k4wD3Xff3CMHZvn666/4W2xQ4N8/3t7T/T2bs9UW
 Iqmxvy0u6vBsCYT7VopDzBKHy1XXo4Pm9Vf5wfJoUOHaddNl/OGi/xSy/uh/zD2RD
 1Ld0Ym3zP19xC37hJtRuRaB2VPVAt83sTKH/fBZ78=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by
 iesco.comsatshosting.com with SMTP; Wed, 23 Aug 2023 03:08:03 +0500
Message-ID: <77.DB.10987.AD435E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To: intel-gvt-dev@lists.freedesktop.org
From: "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date: Tue, 22 Aug 2023 15:08:17 -0700
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsVyyUKGW/eWydMUg7XzuCyWrZjG6sDocb/7
 OFMAYxSXTUpqTmZZapG+XQJXxpJ1F1gKdjNXtPUvYmlgfMzUxcjJISFgItHz+TlzFyMXh5DA
 HiaJDR+esIA4LAKrmSUu/nrIDuE8ZJZYcf0XC0RZM6PE/bm7mEH6eQWsJY482ww2i1lAT+LG
 1ClsEHFBiZMzQUaBxLUlli18DVTPAWSrSXztKgEJCwuISXyatowdxBYRUJf41dzNCmKzCehL
 rPjazAhiswioSuyZugWsRkhASmLjlfVsExj5ZyHZNgvJtllIts1C2LaAkWUVo0RxZW4iMNyS
 TfSS83OLE0uK9fJSS/QKsjcxAkPxdI2m3A7GpZcSDzEKcDAq8fD+XPckRYg1sQyo6xCjBAez
 kgiv9PeHKUK8KYmVValF+fFFpTmpxYcYpTlYlMR5bYWeJQsJpCeWpGanphakFsFkmTg4pRoY
 q5UcrkXnzvn3uPfWnADxumYZDp72iCc5JVeO3Nor7sWvfzU019xt++nM6e/YvJcpb8xcLHWt
 f7qVd9qKxnW216clFxWxHXxwKdtQYM/Ru/IfAs2tp62Zs87q04sTLS1h4v4y2b8vzWmaoGvJ
 0n/VNEJ2xjZvM9su43w1G/7b314+3L7J99QpJZbijERDLeai4kQAW5YD8EECAAA=
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
Reply-To: chnyne@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

