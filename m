Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DA57FEBE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 25 Jul 2022 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6025912BAC8;
	Mon, 25 Jul 2022 12:05:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA2D12B8C9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 12:05:56 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id r3so19642222ybr.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uXwCn0jDYknAJ5LbLyTTNW7GLM9SiKp0MCZeY5zZWBk=;
 b=H498TF5zuXjxqL/hone/Yg3sz+ICxYsDx3SyBk8knsiEhcjSnrm2juFNMQ+YkDMN3G
 GnrBlfJxZDNQTOD/ctyNUTVynQX/strtJHl15gv1xJuPOkm5CO0Jb+lkmt6LmVetSg1D
 IwesHoyNlwAS3/QIXb073Ge/KF96rWhMJRM3YFfTKe1AQ/5DrmbhsYUEHMdK27Pgxk95
 rrHX36fPCcNYF0yC7aWbMmhRdALBvdjQSnG5mZ0sV3Cf+jj4sz8w1hD9POwQGFx9+KHJ
 C3i4ffi7Iie+er6KncsswUgHHVP5VhS/kdE6DK4BMRdfq1+ufAikjhCCRvtOJMHzzoGX
 pDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=uXwCn0jDYknAJ5LbLyTTNW7GLM9SiKp0MCZeY5zZWBk=;
 b=sglThOJE/ce6D0j6KQZtzAhglNSbMnzvQ4BZLczrEwSkED98X1LV14WUoRA4ghKzTD
 XNUu2FD31afIsHSGQIJo2TdLZOCepBbWyf89CZDq0bMCKh0dL1ihI4GPYK6QoWfoSdC6
 WwTZIWcb46Y2DoxyRI6hZwm3WQwGPjaZeAnR6xlLFywYID+Jl+YV0l7Y2hcyANQapn8f
 pN7T55TAUtuVZcz3DaOFsbgEZSTBrUOhKA5iBB27a6LVIl/JpDNquaS2cbGtMuJLnzZH
 glCbLPaBPst7ZNdrwZzOD4e2AtmSFwMJrjkz3b1YLa1U2A7o9Mv7rQZmf/1yfYfnWFY8
 4bZQ==
X-Gm-Message-State: AJIora+LTiD1cnHFMg8DGgVuv0u4Zn4OylZBzgmqgpvRq6ATR1H7Q7/M
 gaG7pXmAQtR4APQuLIMfg1kSg3lsMsW3W2lmGPI=
X-Google-Smtp-Source: AGRyM1sayKsGrxDXLg3s+JI/kGIUZSx5clXqFAzsPSLpigiyCogBDSOIQyfYJsuuLqHxVukYcxuLcRT9bZFo0DadJ7c=
X-Received: by 2002:a25:ca0b:0:b0:66e:c03c:aa77 with SMTP id
 a11-20020a25ca0b000000b0066ec03caa77mr8674124ybg.371.1658750755840; Mon, 25
 Jul 2022 05:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:164b:0:0:0:0 with HTTP; Mon, 25 Jul 2022 05:05:55
 -0700 (PDT)
From: Stefano Pessina <gaturifaith@gmail.com>
Date: Mon, 25 Jul 2022 05:05:55 -0700
Message-ID: <CAPM7riKWJs=Y3gEQR3Z14w=3HG=Y9AQVOVFGLvGwqjL_spznaw@mail.gmail.com>
Subject: Re
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: stefanopessina466@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=20
The sum of =E2=82=AC2,200,000.00 Euro has been donated to you by Mr Stefano
Pessina Kindly get back for more info via stefanopessina466@gmail.com
If you are interested
