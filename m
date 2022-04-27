Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA510E19
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 03:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC310E0F3;
	Wed, 27 Apr 2022 01:47:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mta-out-06.alice.it (mta-out-06.alice.it [217.169.118.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5B10E13E;
 Wed, 27 Apr 2022 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alice.it; s=20211207;
 t=1651024042; bh=m9WtUeW5WbLyaDyXUGKspd8UYZln3gdM2y7sv04wBfE=;
 h=Message-ID:Reply-To:From:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=R6xcRdVt9Aix06wKQc1znyoYq64KvWigU8Efi1BFlkH398fJ50vzTH305SlhEIQLCgqrbbHbVHO7WD5dgIXEYCp7ZRxQPTLO6NYgU79RwgXnbrjMxhAEVqdHIZ1B9zBoojUN3PVb0CJb+tqKZfmp8BaRXy09bESH2UB9q2UMDX3gnZzSf3HtO8u9IJbhO/ANAZ2BiVqFuPDLGM09cIX5j/9jdMKQ/MKdx/Ghmlz/goFsWJTrn4LLMwEG+d51SDDLO/Ea5AIvPnZm1O+cK6nbMimzej0/JFm/dIxMVUNMeGskDrjkanomdpfC+aZM1BkOQlA7I81sgRIwiXrrEzrlCA==
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfvgffngfevqffokffvtefnkfetpdfqfgfvnecuuegrihhlohhuthemuceftddunecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogfpohfkffculddutddmnecujfgurheprhfhufffgggtgffrigfoqfesthejtddtuddtfeenucfhrhhomhepfdeurhgvnhhtucfvihhmmhhonhhsfdeovhgrlhgvrdhtvhgssegrlhhitggvrdhitheqnecuggftrfgrthhtvghrnhepvdethfejueefiedtueduudetheegvdeugfdtteegkedtvdfgffdtieduheduhfeknecukfhppeeivddrvdduvddrvdefledrieenucfuphgrmhfkphfpvghtfihorhhkpeeivddrvdduvddrvdefledrieenucevlhhushhtvghrufhiiigvpeegheenucfrrghrrghmpehhvghlohepfghsvghrpdhinhgvthepiedvrddvuddvrddvfeelrdeipdhmrghilhhfrhhomhepvhgrlhgvrdhtvhgssegrlhhitggvrdhithdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepihhnthgvlhdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgvhhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhgvkhhtohesnhgvthiivghrohdrnhgvthdprhgtphhtthhopehinhhtvghlghhurghrugesuhhsrgdr
 nhgvthdprhgtphhtthhopehinhhtvghlihhsseifphdrphhlpdhrtghpthhtohepihhnthgvlhhlihhgvghntggvuhhnihhtsehqshdrtghomhdprhgtphhtthhopehinhhtvghllhhighgvnhhtsehmrghilhdrughkpdhrtghpthhtohepihhnthgvlhhlihhgvghnthgtohhpseihrghhohhordgtohhmpdhrtghpthhtohepihhnthgvlhhlihhgvghnthhshhgrihhfrghlihduvdefsehrvgguihhffhhmrghilhdrtghomhdprhgtphhtthhopehinhhtvghllhhighgvnhhtfigvsghhrggtkhgvrhhssehgmhgrihhlrdgtohhm
X-RazorGate-Vade-Verdict: clean 40
X-RazorGate-Vade-Classification: clean
Received: from User (62.212.239.6) by mta-out-06.alice.it (5.8.807.04)
 (authenticated as vale.tvb@alice.it)
 id 6259240D0330EEFB; Wed, 27 Apr 2022 03:47:19 +0200
Message-ID: <6259240D0330EEFB@mta-out-06.alice.it> (added by
 postmaster@alice.it)
From: "Brent Timmons"<vale.tvb@alice.it>
Subject: RE:
Date: Tue, 26 Apr 2022 15:47:17 -1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
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
Reply-To: timmonsbrent14@gmail.com, 
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

I was wondering if you received the email sent to you last night? 

Brent Timmons
