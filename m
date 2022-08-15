Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133C5A0038
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 24 Aug 2022 19:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B830BD497;
	Wed, 24 Aug 2022 17:18:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB9D44FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Aug 2022 20:24:14 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id v4so3079489pgi.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Aug 2022 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
 bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
 b=W9YLFMQdKTj18DvQIK792mlsLtA+TS77sHZ7CaSRXjxIyIXq41Bcc2wPY1zCSxzLpt
 7IdGdf+BAW4fuYYUZ+WxZyxejCWkMphUV39ekl743oJj3vr+hlm5MKMYFbj5fo3Y1Xhq
 txnueWMKXOb+cVB9jNE27jtZ4wRswCFdxLBwfWN8v2JsvZLfbjsl/79lEeVNElk5D0Za
 ZTBBi6B5guVjpG2d3O3nMrGYM+qdRc49C1a59O4cCfW4oZTXmWu6BIXi+60xk3qRDWmR
 xmphp7NSpnmKmwwQPy6KT3WA1eZ1czLtOXMG48wfs6mzeHKtNfFOYcJp0glXMIohb8Mu
 4cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc;
 bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
 b=aw+QbRH1xj2Z+i9cPDPxsX8ipqvHM4sMmDnEDRglHkOk7FJkOfjEXo7VY2JKRKBPar
 35cFnQoiF1c7mG3dCARRAP4v/whZe3rCrACuAHHn2qyi+KnHAA3PwzC+WqwXpxwlRjjK
 nk2ZMcWXUZ54Z02dZ84Bc95Dgr3IGxxnsZu1D56bBan9sJItq8l2sThhwAnTW8/8fyRT
 IGs0xahLncNhTUJnKhCv1L99p6H8HAELDZl3jaO5XzoCvdiMabUpIh4vqlYDYZK052vY
 ziMspDwb3DOD4kvYyEkAip3rtuN/g0mQ5BMQWqwt80k1Dp72qmVBUaFmfbblqjqwTXgC
 rmNw==
X-Gm-Message-State: ACgBeo2zn5oSmAPSYHAFlEqo4z1N5FWwQWkJISCX+UA7qop577e6XuC+
 Ky2V6XZelDdNQZNDPRQO26mcyaPzYUReF4cfYQc=
X-Google-Smtp-Source: AA6agR7p7hUG4HSaPnoEfwR9zwWGqh59t43Ye1/jqV7LCSESXUry0/mRr6A5VBJBe5E1QIMERSLT69Uzmt3MKtGsECc=
X-Received: by 2002:a63:2008:0:b0:41d:7ab5:ca31 with SMTP id
 g8-20020a632008000000b0041d7ab5ca31mr15107819pgg.17.1660595054235; Mon, 15
 Aug 2022 13:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:cb53:b0:45c:8ea1:fdc3 with HTTP; Mon, 15 Aug 2022
 13:24:13 -0700 (PDT)
From: "Prof. Chin Guang" <poolcatfish@gmail.com>
Date: Mon, 15 Aug 2022 13:24:13 -0700
Message-ID: <CADP_pteR23A2HNr9HO=23GVzLgPXaqBZw2AFhdLB-5QH_34nxg@mail.gmail.com>
Subject: Greetings,
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
Reply-To: wijh555@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang
