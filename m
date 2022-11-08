Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0C620E7E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 12:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A010E3BE;
	Tue,  8 Nov 2022 11:19:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E44510E3BE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 11:19:00 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e189so11186724iof.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 08 Nov 2022 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
 b=WfZENGWI8Gki4cfu5FTM5+AmIDxP3MUS/nA6abRf4V6IQTWzEWg7SsTNapD2fFKv4Q
 LST/wpHjwxS4+MxHKqdTh2pjyRMGfqL9Ejgju/o1uosJYkC+2R8r7niD8KOmBmpAYRl/
 NlaZP1ELB9sIwASsi4RzZAc1Nf1JXP308nTv8lQDp4EL5T8yR/w8sKD+vEsXurc13Pyi
 5Andzud2TPEB0IjZBH6sfLstq/ImUhewLKH4gxfSILnXKoGX9g7GxegE+WcFQf4Sz1Lw
 9O+jmvizPq9YAMk2wSBqSRp7SxfmXA90piMVWh2y9AfhhzzVNXpoRo4iiJnubiwPT0rR
 4PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
 b=LRIh7l3C2aay2w6swR5NN1QVuGE4qh4sPdPVakx/hiuzSmvqEt27LjKGZyLWMaVGhH
 dli/eqhL9IcihUXDnoxzAVPhVS8hEV8CqX/5RIrnJiQ6e7BOdmBt5ZdKclOZWOtOEsyo
 8mE5VnM6Bvwrx+Wgs9ylrwTwWrKFtJHQvMY3OzIEzj2k4jzFEprkPkEOZ6a4ou7bhwm+
 T9HMBNJtMzQlftD/fLKjbu8St/rIe+Sezj50ZNENxDTb/vbUDpDQyS3wKc7WTs/07tWm
 OjBg5heTPI3yGNYoIO3plXseeFkNTu1AdlYJkmC81SEt/IaGKr1+KHwa3RmUS8kR+n+r
 AmEw==
X-Gm-Message-State: ACrzQf2ZzewUVJIMS5alkuLBrf07LNgTlw1hxsbh/rMkylHFTJEQsPlK
 4HP6utNoc0awc9ZC6PsM6XQCGxomMO47Rh8Bbzw=
X-Google-Smtp-Source: AMsMyM7rydZwVc70WUuTl1zJ4SYLvA3VBiU3NqRxeOJToxDegaur+FhXeb6ymqfAFpBDQJM8Gh6lsU9A+k5iwIg0r+k=
X-Received: by 2002:a05:6602:164b:b0:6cf:bc3f:fcd5 with SMTP id
 y11-20020a056602164b00b006cfbc3ffcd5mr30190653iow.119.1667906339859; Tue, 08
 Nov 2022 03:18:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:38a9:b0:375:4a9b:180d with HTTP; Tue, 8 Nov 2022
 03:18:59 -0800 (PST)
From: "K. A. Mr. Kairi" <ctocik1@gmail.com>
Date: Tue, 8 Nov 2022 03:18:59 -0800
Message-ID: <CAKfr4JXAt9zqv0qeZwO3it42gt22OzwY0qhgMOSkHWFvxW3drg@mail.gmail.com>
Subject: Re: My Response..
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: mrinvest1010@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Dear

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

Let me know, If you are interested for more details.....

Regards,
Andrew
