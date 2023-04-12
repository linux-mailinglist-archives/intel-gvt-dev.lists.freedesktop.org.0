Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2806DF2CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 Apr 2023 13:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD6C10E794;
	Wed, 12 Apr 2023 11:13:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2F710E77F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Apr 2023 11:13:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-50506111a6eso295843a12.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Apr 2023 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681298036; x=1683890036;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cIuacTUe55V68yxCoo7ary9vLzT4+1nPwynRvBBZauw=;
 b=LTgw2RwzbAyAziHLb63ut/WWM0RDIXyPuQh9DQkSIrBn4QSWP0MZLBcv6uLKb6jjty
 z63pYtSEsR+ZDTwYm2gsNkxwogoNTShqnYijRO/TSDCyefnewn4cuRLavjBAc7clgPum
 ikmvrTgLpikA0+YNOfd/XnT9oV1RISxlqXsl+AWElMXW75MgJ8h8ZTy6m7NJkhh9oZlb
 sdcr6NJHaIeDHZo1J0J6sQl6rKZidvbulL+1hYDtQxKbLF2dFZI8rMS+0ccJER1kP0Da
 bAzaCoOaZokPOgIgs9fcfXB1XGabR419KEj+WtuqZnYUUt6UAy7BNvyklM8iFNHV8eDY
 niZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298036; x=1683890036;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cIuacTUe55V68yxCoo7ary9vLzT4+1nPwynRvBBZauw=;
 b=u6gwD/P0sbnkK4awiTOYXEMn0zh1KSWALzfxgg9mNKcVqvYcXrfVzZSeiDGOjJjB0E
 G49HIuYXW7Kkg0WhyrND3+EgdGSV2cjQpNIZT286WtX1TB7YDtPS75p4ho3L9ynkDqrs
 G51iNmnXK1Ibx2qsZJ2yl0k946o1IBKkDKjVXzGEq+Ka7PvDJY8VYhAgrKRg+R9WObzZ
 0inVGdXbVE3IbH0Hjgg5Hnc9qsJ48c9rCn5qc96VDBfFUMK6waLmgohr3xbvrvqcJsvk
 ItfnfUtHI3DKWr/TvMJ8MPzPqlO2VODaY8j+WXKD1UKoJCJI4X5EF4raH1sWsG9vjX5n
 rVdg==
X-Gm-Message-State: AAQBX9e9BP7sopRviVHmFJK+IOlZ4J56ts7gw1rfNvY4/0Xpj4N0ieB3
 azXet9J+fhlrESb7H+cc2qaNTPekTh9zHHrsXr0=
X-Google-Smtp-Source: AKy350YJPPX/5YbQhRQjEevtNqK/BCVkZjbUlPh++VnvOKOYU+s76w2HH+dUtr58mKdfFErALITDg8S5exHztwcTWa8=
X-Received: by 2002:a50:f693:0:b0:504:9200:8c88 with SMTP id
 d19-20020a50f693000000b0050492008c88mr1021387edn.1.1681298036247; Wed, 12 Apr
 2023 04:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:2789:0:b0:206:d8d1:6dca with HTTP; Wed, 12 Apr 2023
 04:13:55 -0700 (PDT)
From: Shahar shalom <anwarialima4@gmail.com>
Date: Wed, 12 Apr 2023 11:13:55 +0000
Message-ID: <CAJQzuVfbTbQKpvdnRn1qccjQCLaw_iv5ar-RtMxayqOJWnqAvQ@mail.gmail.com>
Subject: =?UTF-8?B?5YaN5Lya?=
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Reply-To: sharharshalom@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

LS0gDQrkuIrlkajmn5DkuKrml7blgJnlr4TkuobkuIDlsIHpgq7ku7bnu5nkvaDvvIzmnJ/mnJsN
CuaUtuWIsOS9oOeahOWbnuS/oe+8jOS9huS7pOaIkeaDiuiutueahOaYr+S9oOS7juadpeayoeac
iei0ueW/g+WbnuWkjeOAgg0K6K+35Zue5aSN6L+b5LiA5q2l55qE6Kej6YeK44CCDQoNCuiCg+eE
tu+8jA0K5rKZ5ZOI5bCU5bmz5a6JDQo=
