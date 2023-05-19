Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E862709396
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 May 2023 11:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE7510E14E;
	Fri, 19 May 2023 09:37:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6B610E34C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 May 2023 09:37:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-510d92184faso4500462a12.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 May 2023 02:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684489069; x=1687081069;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MykftQ9vqsw04OqgCh7rrq9rV2ToZv4V/lyH2OaLw/w=;
 b=i+OKJGE4Cc6Thh0Ue19f3PsB2e1ClXh02qPDtCxBG1sYqZJEIro+1Ox3xClnCsa1JU
 nmkOPIoPx8TPyh+G2jZZhmOaWxvyJSIIpxZocCVfQwOaYK96YpWY4N1O5UfNJ2h1I2cL
 8JeOoaTHn8J+sZ6c5bNUCu25oaF4EwGa/PCdW8fzx2PqznSJvbDPFJ/EODMtQvn4m2qM
 1/9xrWSpNecEv16fP6IhwMCTVDLKiVAFa1wYyLBOhDpWWaPYQBKWyCazN0N1Wb0s3Ao6
 qSULUbrwZc6DOTT+eTxfhdTJiP9LyutNrN9QWGOBJYH2LtyxU3HPUZ79o88g8Va2ak+T
 2mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684489069; x=1687081069;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MykftQ9vqsw04OqgCh7rrq9rV2ToZv4V/lyH2OaLw/w=;
 b=lVwOrorEuufkDwi/MJHaRmKBcBW8hLiUoSio8zV/tZ/RfW2r9YKxkrdBM/EJtApXHw
 h796Lj3lYQBwvOf2UEOV2z3iI9/qETArGr7i1iIDP5AfYWKFaow59OaBI1Si4qTdIOEm
 9+4iDg8BvlIkIBq/oUZK0hZDWv4O7Jh6YYfbuqyaAA0ieyKZxZ07f2V5HVZxJADbyaK2
 FV0Fs8VuCJIYvMAWViQ3x1ZHh2AoZfKKV7938QI0JdvBmFQczG+Z2PbV9UQIROBnoMcu
 VSX5PoCfmG1N60tb1eGtTCOXooM1WtFxu6C/uDEVZHcFmcHxHyQYgLL+kII/LC85i+p3
 +Qlw==
X-Gm-Message-State: AC+VfDwb/0CH5Q5QhRc+IAxbILv0DR98H6eghV7rzEprII5N2lnbmGBU
 qEg8DGKnk29+tkadJT8+MwnzNSZ9nFbuhLvyDBo=
X-Google-Smtp-Source: ACHHUZ4zQwqn4fjiwemV2BOFOkr+nnTqF0kF+CPQA8hJaG2S70dDG9SQI/mhZcZWhe78GcA1o7Ac7UNaKhu+OTWhzU4=
X-Received: by 2002:a05:6402:160e:b0:50b:c72a:2b26 with SMTP id
 f14-20020a056402160e00b0050bc72a2b26mr1089418edv.9.1684489068463; Fri, 19 May
 2023 02:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:af92:0:b0:1cb:dafe:30ff with HTTP; Fri, 19 May 2023
 02:37:48 -0700 (PDT)
From: nina coulibaly <regionalmanager.nina02@gmail.com>
Date: Fri, 19 May 2023 02:37:48 -0700
Message-ID: <CAE4etd4QJhtnLGA=LNsq_9m3z070W8+e5TcwB7QFKTV3Ba3YYQ@mail.gmail.com>
Subject: from nina coulibaly
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
Reply-To: ninacoulibaly03@myself.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs.Nina coulibaly
