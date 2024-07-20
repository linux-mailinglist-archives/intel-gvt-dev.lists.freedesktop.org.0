Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436C8938241
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 20 Jul 2024 19:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EE610E1B2;
	Sat, 20 Jul 2024 17:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PVEdsPqp";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F87B10E1D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Jul 2024 17:14:52 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-78964fd9f2dso2015304a12.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Jul 2024 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721495692; x=1722100492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject:to
 :from:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=OfqZ//3OxReMquU8+AGgL9xNgwmaunZOL/+qPFEzY5A=;
 b=PVEdsPqpWJo71kph6WukBCrchSdG1BLjzKWFVF0c7BboOT9kpLVJGABXb/SEf2mUP3
 KsseKZokXcXdiWMk3RCChayYWWTQlF9pp8ZzsXmYQqvTzsZHdUWu9Lc69ngV5dcrWTIC
 fMXNhhAUqFJ+6AtwACs79/6DSe3fzC1ZT1WNpKMFoG1UiwCfgfGUwEcY30DECBhz1L/p
 xIG9YVEw2zoBit7bMPpz5+6RoZ0HRUr+EO7Pj3w6N/JqO2PoCWAd3X6nRlrywRnsWXhm
 eplsc84oPNJg9+QrFZSqMNmLXYZd3dLrcSfkFc6X5RQ324pNAWZnig2y14cDoGADFBi4
 HKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721495692; x=1722100492;
 h=content-transfer-encoding:mime-version:date:message-id:subject:to
 :from:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfqZ//3OxReMquU8+AGgL9xNgwmaunZOL/+qPFEzY5A=;
 b=scN1qmRH/bcR4haOkOzTZRfGgnniCAoWCK2zhlTwFPhPDlym9veyaSVuKGSwXFqg4Z
 tP5+EONqtQnv+JoSTj72cvAfX4lger2sBWcu5sPqeC0TsfU3pe+njb16iJGC2838z7NE
 FU7+qNI1u8nAxzGCGFnbaVtihPlNwzuktlRTKI6Bv+zId2biU7qhW4wGL5KIUKq75eIQ
 Jg6PBdtVfC8zxOcXuhMW5NXpSVyij6Gbh1RNs4iFQPSnQtTy/M11c8ye+qhoKztJuktI
 E7azHXleQyHbJHWIvNbfTs2uX2VgkpuzbqrFiB/LMEPIItz8ZInM85URBv5e5z1xjAF6
 ZNiw==
X-Gm-Message-State: AOJu0YwE+zmeDXKEKYFao3WW3L3uxD4BXhQB4ECEhVdRVcQFK8V0+LTk
 gS9/WHEt/yDLXqNV1I/UobF240fJcsI9NQFXa/3W/VFccY8XJCR/1jg2gNLR
X-Google-Smtp-Source: AGHT+IFIAgzJFGOqgx/xYmJhEj9D9b3I0LRa7TvAjs1K3VJurBYNUZKeoc4opM806QtQFTX6J7ygWQ==
X-Received: by 2002:a05:6a20:3943:b0:1c0:ec1c:f4b2 with SMTP id
 adf61e73a8af0-1c422992f45mr4317096637.43.1721495691843; 
 Sat, 20 Jul 2024 10:14:51 -0700 (PDT)
Received: from DESKTOP-VFHUU51 ([38.88.124.165])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff59dff4sm2819138b3a.152.2024.07.20.10.14.51
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2024 10:14:51 -0700 (PDT)
From: "Luis Fernandez Consultant" <consultantluisfernandez272@gmail.com>
To: "intel-gvt-dev" <intel-gvt-dev@lists.freedesktop.org> 
Subject: Re: Good Business Proposal
Message-ID: <e8ed9c0961e1fd458f958dc26ebfbab7@192.168.1.15>
Date: Sat, 20 Jul 2024 19:12:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ascii"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: luisfernandezconsultant@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Good Day,=0D=0A=0D=0A=0D=0AI am Luis Fernandez from Madrid-Spain. =
I have a business opportunity that i will like to dicuss with =
you.=0D=0A=0D=0A=0D=0A=0D=0ARegards,=0D=0A=0D=0ALuis Fernandez=0D=0AMa=
drid-Spain

