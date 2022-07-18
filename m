Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7F5789C5
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jul 2022 20:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F70A10E173;
	Mon, 18 Jul 2022 18:47:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185C10E173
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 18:47:39 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso3820850otb.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
 b=ePUT6dVysAkIZFKOLfNdqT7xedQOJBYadodmJhYbRZ/N+aedJupv2LzkfbQgnayWUz
 oEXvX41sTVlbxKEfL2Sn4jdQdSozH7GWNtTjnPTK/8upUZgDghSo4T4lgaw0rdf2UCmz
 VBcCAqBua1vu83U/1Piq1/ozJXW6abxnNzup5K60JZlzsdQYRWimViy6oIyVupWNESEE
 lOtrXuchlJ1HrEBR5qK8NNMSqS2p8P0ac27nyb3UDAkK0IcZktF/g9r2kbjXYMQnsQvp
 Cs7dcANmYt5PzDGIQ4EN9FYLu8HHQCkw0RKfhFznt1GRXWGPx6ESOq5rssGbjMY/qm83
 d29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
 b=MCW3CshTa4GqKFFeaMSH4bXM/C7KCgVw8x1LIPOigjRqvfOG8FXMA1P2PKHLZeaL/K
 r8oOy2/N+hq2HDgzhechHclKtkBF1VLOMfInUaCWMwyaVxPT8XBO0t+XxUF+A7tT04K/
 pupkzFO2mNKMEc51J7JNDW8Gb86zevrEUh9kDWe1EFxh3KDgBv7xx0rdW5rMpWpnXTaH
 t+/Eff5wYOIBiDeknEeSywJP5N6bznJxe5GEUgZHVfxKOP0NAbETtNnFjytP6NClHwUd
 ZBe0JH+RwJaLGODY+j/cFO9jeOwVGGy1v+NVBEAptqiQDSBj0WqBUskLGW3oF4wmRrTd
 PEQw==
X-Gm-Message-State: AJIora8PmOZQ9+P10srHQLi/Dmq8lPOOcZMfL9fgF7PkEJfsHQu7fBQa
 niegY7fT84FqxnU1xfLgSjUDR69xiTePBcNuplE=
X-Google-Smtp-Source: AGRyM1sN9npyZ90saYAyzToQrTEliIs41GFk+lN5mNyx8YBM5MXK5qyIJPLaCDWfhXoe+S4Zjf8apP5QzN1+joGtQaA=
X-Received: by 2002:a05:6830:16c8:b0:61c:a083:8a70 with SMTP id
 l8-20020a05683016c800b0061ca0838a70mr2916654otr.163.1658170058968; Mon, 18
 Jul 2022 11:47:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:b093:b0:314:5f48:8afc with HTTP; Mon, 18 Jul 2022
 11:47:38 -0700 (PDT)
From: Lily William <gonwse11@gmail.com>
Date: Mon, 18 Jul 2022 10:47:38 -0800
Message-ID: <CALtkzusMkJdwJGWaMgSNQtn_4npe=eywuOaEQt1r=_TteNdQYw@mail.gmail.com>
Subject: Hi Dear,
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
Reply-To: lilywilliam989@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
