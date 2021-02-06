Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C277311DBC
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  6 Feb 2021 15:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEA16E44C;
	Sat,  6 Feb 2021 14:38:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3B6E44D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  6 Feb 2021 14:38:07 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id r21so1357842otk.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 06 Feb 2021 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
 b=MdFBVQFx/9PYai76Ah5G9A8Q+CdwDyBl+huV/V99nXOydFVnHiV8jCm4ZMcxTyh9P5
 xF0bnW/+6txDPRZR2QVOZH+i3c0nQSjIqGUx9CiLUuG1GT3lXtwcF4mI6OhWpIBHBAfD
 ro0Aj4MMUvmqtgrxr9nrcyxlnfRuXJQ24ZAy2A7yaL2Md2V1g7W3wWHrsLQdp6wZ3t/3
 v2AUyStFfsvsyZnIm7u93OyBxgyKTM8rrTOqUqii67sbdRaWmqukXOPc/zOpFs2gEvk8
 dBIwDEhmeBP6ncWpTAY6VhV2YJzZOFPVzJHfPYD3V0vgrnkF0bi1blqOmdQBOYrWn4Mt
 68FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
 b=ZNWN4xj1YDqcPiEmRKZKK9imymFS2Z+kT8BBJ40ECA7dgSm8g+v0JbgNK/LReNbkJQ
 P4ezpdd3fvD73Ru6L0wGp++CXP4XyFjTwFIcOj9ATkka4tcayJTCGfkndK1Np/JWvudk
 dqyP/i2RZzdxsJgx6WfWfc48SoIrrrLXZRleil4gzUMK0nWZiWMNoSqWXnTAw8GizHMT
 HDh/2HOcpqmiHgg3gZOxvOa7t3vofmb5EGzFcaY2VVS/+rPf2nK6JNRF2FT4li2KHzTL
 4/Yj5Xord1L3CgrLlqFt0fZFg0Vd3TMIUM33IbJ8lYz9mzgIgQ8va5aZ72pev2Oo8f+u
 I+tg==
X-Gm-Message-State: AOAM530MdVVjY2uzUWMOBAhp5SkbJj6igTA1jnjrFTzywZ87O3R/ICYj
 KzpxyEaOTI8vE4MxnqGe74Euh6YtX23Q0x/OlIc=
X-Google-Smtp-Source: ABdhPJzABsfAmNAgHhtpUDMUPXgKGOR6fa6uFo34NWbnxNJAfqETL3veLKetNzf0mYoh4S7hSG/eRayHhEdWN6uFcQI=
X-Received: by 2002:a9d:69cf:: with SMTP id v15mr7279137oto.122.1612622286744; 
 Sat, 06 Feb 2021 06:38:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:3e4c:0:0:0:0:0 with HTTP;
 Sat, 6 Feb 2021 06:38:06 -0800 (PST)
From: Barrister Daven Bango <stephennbada@gmail.com>
Date: Sat, 6 Feb 2021 15:38:06 +0100
Message-ID: <CAO_fDi-KyCay0L6vu6VJnBLRLeSsAN8ozL8SZB7ScnMnBD4STw@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
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
Reply-To: lawyer.nba@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

LS0gCktvcmlzbmlrIGZvbmRhIMSNZXN0aXRhbmphLCBWYcWhYSBzcmVkc3R2YSB6YSBuYWtuYWR1
IG9kIDg1MC4wMDAsMDAKYW1lcmnEjWtpaCBkb2xhcmEgb2RvYnJpbGEgamUgTWXEkXVuYXJvZG5h
IG1vbmV0YXJuYSBvcmdhbml6YWNpamEgKE1NRikKdSBzdXJhZG5qaSBzIChGQkkpIG5ha29uIG1u
b2dvIGlzdHJhZ2EuIMSMZWthbW8gZGEgc2Ugb2JyYXRpbW8gemEKZG9kYXRuZSBpbmZvcm1hY2lq
ZQoKQWR2b2thdDogRGF2ZW4gQmFuZ28KVGVsZWZvbjogKzIyODkxNjY3Mjc2CihVUkVEIE1NRi1h
IExPTUUgVE9HTykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2Cg==
