Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA49502646
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 15 Apr 2022 09:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196910E1D7;
	Fri, 15 Apr 2022 07:35:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7510E1D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Apr 2022 07:35:08 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id bc42so3251011vkb.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Apr 2022 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
 b=ZdsSC0RBp88z9K5tt5DXC8f4GIqk8WfQRtLfCI1xrDWmDy4cTKadAER8xnmUk4vgo/
 2A1/ZUinAgRrsYTTI/WhmzqswDS4IYTWiv12fo54zzeOebkAikmUQYAyHlFCRM6uY6if
 6gRFT6VYs22uf5/LOgaUMwjw2QRtagj+HJ935pqE7UT0b/ki0smYrsxqsOEvPvshH0R4
 Uaq8rctQRWMiDcGaxUVz1S/gqKyIg/49RUZamhM5gTytqfOiKe5pOcRHh1FwOF0Rn80j
 ZkiMkrbnx3P82OCLsZLGUb0pFQZnrNIljFRtINscW6eoQ4UdkAnxAdfLNskI/LTMzJ2w
 GVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
 b=cjGVt8gdGkBScZgjWUNe8IOmZ7M6PMTk6T9MEggotGxBjXOecHhHvutBL6zK+Srabb
 wfsa5bHhpFN9H4DNvYqGTkJIJPi/dMYnKkOdMLlNnfHSQMVMAuQyk1n9hf80ojhFOCS/
 FFwHIWLCrG+1jTV46nAX4kHu5NYbgu+JAkCWITDzji42laryi4FCCLlhiF1Gk7mkc/w0
 ADY9qS3yMwdEPpQ7dTVFWvfDUTHjHOxbSjxIaP3L32cm0uvWzck850xIxO1EmbBr905b
 rRHMFNcxr89WtQpqLYmnmTjUZhpI/KUCti5RUvtuo+/nSPP2NgPxsY3zJ8EgQ5GqJH7+
 hyoA==
X-Gm-Message-State: AOAM533/sKGf/qP6z1QOFuy9cDgAd7eTFHbtxkYEU2ADzxE0uEs7aE50
 ok22vciUpCl55EBJzu+VcBLIUTPW0b1vHbFdbaI=
X-Google-Smtp-Source: ABdhPJzK87MnP2zbgmVELU7Gkh7cW1pB70Rg7tah3LArbgZWiq2F2Gw++XoFLs6473hLFXbnsGlV0fzsMTFHfmK3ixc=
X-Received: by 2002:a05:6122:1814:b0:345:99bb:2e40 with SMTP id
 ay20-20020a056122181400b0034599bb2e40mr2761019vkb.39.1650008107291; Fri, 15
 Apr 2022 00:35:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:76d9:0:0:0:0:0 with HTTP; Fri, 15 Apr 2022 00:35:06
 -0700 (PDT)
From: Seyba Daniel <hadissawilliams@gmail.com>
Date: Fri, 15 Apr 2022 09:35:06 +0200
Message-ID: <CAAC2S9k0Q1aobRZYtc8BO69ybhHkakg-vpo3BkwE+tcmYxiVvQ@mail.gmail.com>
Subject: Hello,
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
Reply-To: daniel.seyba@yahoo.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
