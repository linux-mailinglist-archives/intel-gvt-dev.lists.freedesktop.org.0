Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252ED84E1DC
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Feb 2024 14:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F178610E379;
	Thu,  8 Feb 2024 13:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BO5CQrDD";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799010E733
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Feb 2024 13:22:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b28aadb28so1241807f8f.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 08 Feb 2024 05:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707398520; x=1708003320; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r5wp21F5B9A/byxZ9Ag/T7CAzXg5mJVGYA5uA9+no4U=;
 b=BO5CQrDD8141Nn0A+jAt2FBKBu5GBHZpZkaw1Qu8GO0J3tDGT++o3rHuxQpzoM/55E
 HcduSBXFb0nD5rHZOLAUk+f5zXg5VJQJZWOWS6Z+/2iq2Yl84DbqokGDKQrEpn+yomEz
 yDkvpgN6fO5bBbq0d9IAMyXumshld7Eg7vkbCGNffuMe1MBX3qcA/ZElQdrMzE3MxeWD
 JZ6QvPe9J0Ckp5dWmQ8xSzDbCeNh/PTFXh6f+trqKybu3ka0A1KJw+4ZWjCfo774VgIN
 sd0nFju+SGqjA2J+tknAKgVrxPT4O2iEu3/SANLGN1aOC5GJGmJw6joixJHBbdAUa63w
 rwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707398520; x=1708003320;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5wp21F5B9A/byxZ9Ag/T7CAzXg5mJVGYA5uA9+no4U=;
 b=odaQ2OqEPkxRObb/eYXPwxfARqEGS49iw+gGPVyNwjE3mjaolb20VcILE9acvFFr4v
 IxmlLJrJNooWHVpIibk4Fk+VZpP6AygSCZoCIT85DzRczmltpRgkImEON6o+gEF7Ue5j
 7j3ASv5bU2Jq+/hMdUaBROvSYQ+hRMS2ezDvycvMgNrVHYTsoIwjhcSL28AJbXm1Ij97
 XWe9qEH+N/21kznjo7ydT8VM806cUdEwJK7ayzPaTrKXtWzDMdryM99vhFIMUHyafV1u
 dxCvtkm1c20TBq3BOk+i4ZX078LNgthWdSEJMv6cZRESlPcGTqHWcwltC1dd6nCB8Pb/
 2QWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeoF8JFotP5scVEwJQLfWKVolGxK70Mf3h2fZNZNjD7l2qXiOFJ1pMpdbRv2sYkSY+/3Hegf4OF9XOBB9X2cAvNm16W1sx0mGcXsA39dqnfXt8Jg==
X-Gm-Message-State: AOJu0YxEPb8ubyd9bwef4pCT+amhNQF7r2LmvR53uTADquKvcT9wYr4E
 bXyiczMma/ucUwD2NJHUyCy5Mb0bfEF77cGwk/i3iS3Dv4hgfSK3YN2PdRyoo+ahVMyRMRdQd7p
 +d+wIeQ0SDtuKDOL4qCXRMQTKvVU=
X-Google-Smtp-Source: AGHT+IG1PhJiydbBbbebCRFDwHM0nvopuoUTj5DCnbvbcQXPjy0qMett5SRKsFlmXz+09LKYYOXoO8G1U49wpZkShCY=
X-Received: by 2002:a5d:5887:0:b0:337:b315:5643 with SMTP id
 n7-20020a5d5887000000b00337b3155643mr1257693wrf.6.1707398519583; Thu, 08 Feb
 2024 05:21:59 -0800 (PST)
MIME-Version: 1.0
From: choi hang <choihang91@gmail.com>
Date: Thu, 8 Feb 2024 13:19:28 +0100
Message-ID: <CAOyhcX1uTF=HFPbwzAk=ZQBm6DCtPsHsd+DKBeZpLoZHo_SjPg@mail.gmail.com>
Subject: From Mrs.Choi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003ff8d80610deb2ff"
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

--0000000000003ff8d80610deb2ff
Content-Type: text/plain; charset="UTF-8"

Hello Beloved

Greetings to you in the name of the Lord. My name is Mrs.Choi Hang. There
is something very important I want to discuss with you. I'm a very
influential and wealthy woman but I'm sick and dying.

I'm suffering from severe malignancy and have a few months to live. I am
sending you this message because I want to make a donation to you for
charity purposes in your country.
Get back to me so I can send you more details about my donation.

Warm Regards,

Mrs.Choi Hang

--0000000000003ff8d80610deb2ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Beloved<br><br>Greetings to you in the name of the L=
ord. My name is Mrs.Choi Hang. There is something very important I want to =
discuss with you. I&#39;m a very influential and wealthy woman but I&#39;m =
sick and dying.<br><br>I&#39;m suffering from severe malignancy and have a =
few months to live. I am sending you this message because I want to make a =
donation to you for charity purposes in your country.<br>Get back to me so =
I can send you more details about my donation.<br><br>Warm Regards,<br><br>=
Mrs.Choi Hang </div>

--0000000000003ff8d80610deb2ff--
