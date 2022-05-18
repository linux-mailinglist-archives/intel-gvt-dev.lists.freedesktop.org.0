Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF452C6A2
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 00:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC6F11A030;
	Wed, 18 May 2022 22:51:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1969811A030
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 May 2022 22:51:12 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2fed823dd32so39647437b3.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 May 2022 15:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
 b=EkPc1GkUyZmBG8HPCBCe2XZV3WsuXDLhFDk8QQDzs2G0kRFAjzuH0WstUk+F9BAWnQ
 H/Je6h3Iu2N3PXrPhrGCeVHLMU1RPQmd/eTXO8Uco8hvcbMXQ2l1YbJe9ubK4lTuAIMc
 4KWotxD2bO/J4Igh5ei49wEYZ05lbsUqPd0dxoLQ2ieJWrttKDTraGVnWy6l7lmBtn9f
 Os0bvwGArG34f1Rc4FynfM1KXhlRdiUu6Ew58Z9bl7UqvY9flJoFw/as6OTyg8DUhLFn
 nPWvxbnLcH4H6SgSchNDh1+lKcpTXkyLSfATu6iVTxTS2AbiQOzUwvSjXwRZApsVqPgm
 vwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
 b=ylbICKVuzfUpEBqsDrhMxWLRwTkSo314AeUsm6TOalqw9kZEwszhLZyKBy4vNxngDJ
 wQz1aFr5h6qees6Fv5KPnl7zWyXVR90/OAwubkogQe2Q+FZ4fWQvuPWfWn35dLL1V/Kx
 yFk/aYfoygAWUxD3lvn5WF3gPgGvhT18RQLtpF7jNcr4zIJlh4GBMuc7WSNFf1G48dhW
 Kr0M1T201reXRvyxzjqm0m4fQ33DfBEsV5YZpcRUXfvVGJvJIYy7m8DPXHg2gT0f6UHe
 v3mFkAtKk0quH4sY/0C1xWVmHG08b3Ht4iU8v+HVJzd+ui29T80fjHo3oypsdxyq8awm
 WW0Q==
X-Gm-Message-State: AOAM531jScvR8Hsu5TjMytTgxoXOCc7I7kHGPMQ5NJpMQvN9TP5R8nHE
 on6mIPLzmYDwv7CnVnWEZTFmQOHqFcF4hRg8M54=
X-Google-Smtp-Source: ABdhPJyLLQWjkP9nmWGzMU7MFcm2KYPHXsyCIkBlx+2golFYHpOKAxZVcsEryWGbwx+FQAolqp8AspVzVsEa/9Fl3YU=
X-Received: by 2002:a0d:c0c6:0:b0:2ff:bb2:1065 with SMTP id
 b189-20020a0dc0c6000000b002ff0bb21065mr1929915ywd.512.1652914271290; Wed, 18
 May 2022 15:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:51:10
 -0700 (PDT)
From: Tony Wen <weboutloock4@gmail.com>
Date: Thu, 19 May 2022 06:51:10 +0800
Message-ID: <CAE2_YrAXybdGmY_vbYWrvHLdyhwtDxHe9MWqr9LV4m_cFjntdg@mail.gmail.com>
Subject: engage
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
Reply-To: tonywenn@asia.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Can I engage your services?
