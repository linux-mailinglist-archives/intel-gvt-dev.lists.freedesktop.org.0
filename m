Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC155453E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Jun 2022 12:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23B210E4AD;
	Wed, 22 Jun 2022 10:22:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158510E4AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Jun 2022 10:22:43 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id p31so24405853qvp.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Jun 2022 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=7YCpyQqEboKwjTxLyfkcwugpwblsP9d9SzvYxx81FFc=;
 b=kX+48LSZRRy+3tq+mqo/QGSEC3ZqGA25aBn2rN69ySMEZpaMbOafTQLXV10XdK1dTW
 NIavSkLW2Wi+tPjL2cm1j1LBthEZWpxsyB/PDogZZIvAWQc0cC5IP+QF6OrhIBzprdUH
 OfacH00AJQtLZZ1cdmMr2hfn3Csst4Vm74kZ7kH5TPV77i1r7SB4X7Unp6PR+Vnizglu
 oPtXd7zOYshvAAHWFwHxUZHLmTugU9ZYBIMpcNSIquz9MW5XP72Ou1C1E6z+ENJ+zWBu
 EW+v1hZKzO7mEfpUUG+un7JlETuhOIx/GiKZxkSH5/1HlCT+EAEEFtqonfuGVTjHpvHd
 2ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=7YCpyQqEboKwjTxLyfkcwugpwblsP9d9SzvYxx81FFc=;
 b=4bO5vq1ENnIRajS6qSu/vtpVcDaiWxKGuV2J8YHseRLzAw/TuEcOwzCZKPx9df8r64
 NWmQpppvo6QT4OcsuCVGt/RYZu6zEt3AzpB8nmKGebMxrr+MfUo6Bn3lzsQW5aT3zeZ8
 HntaGgW1z/Zuhn+AdPj8xYe/bGjROZyKhZ8FxjPP7fBXHiJ9wfB5SNXybjoNxaqH7/3W
 UV/ErPpjMVu1XbC2VurH0WprvrXuA9gYHE9A747eAjZ2SU4/wCXEFlCfYh7S2Hqu3OQz
 JP3WiQ8CfiuALULJ0Hfbdn+H2i7NlpBBV5QSxkyzar3XP8nfNJqthipcBQAVL2S4v/m+
 yUig==
X-Gm-Message-State: AJIora9iDJ4/fKYHJ99DOgUEnqKsbpoZ9crCBQwGKtUP2KFHxyb5fse3
 SFhhW7K4PW+m8eAdRqs9GNEFrUKcYLi5ie6u9Wk=
X-Google-Smtp-Source: AGRyM1s9LKX3lw/VZSmGibzQNHdHFAVP6lnGs3WXAK/lgMtU9VxS8tLiL1+P//vCGbCrPOvVIEhcKlxJ47a8g8xbpWg=
X-Received: by 2002:a05:622a:5c6:b0:316:f0d:3d41 with SMTP id
 d6-20020a05622a05c600b003160f0d3d41mr1236851qtb.30.1655893362610; Wed, 22 Jun
 2022 03:22:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6200:645:b0:432:13d1:1510 with HTTP; Wed, 22 Jun 2022
 03:22:42 -0700 (PDT)
From: Koffi Aya <djibelodjekouss77@gmail.com>
Date: Wed, 22 Jun 2022 11:22:42 +0100
Message-ID: <CAKUXmggUCBiainPeY88puYwLC-iDyGMqRssqCiPms98V79q1pg@mail.gmail.com>
Subject: From Koffi
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
Reply-To: koffiaya202100@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From Koffi Aya
Dearest One,
Good day and thank you for your attention. Please i want you to
carefully read my email and assist me to handle this project. I am
Miss Koffi Aya and i humbly write to solicit for your partnership and
assistance in the transfer and investment of my inheritance funds
US$6,500,000.00 (Six Million Five Hundred Thousand United States
Dollars) which my late beloved Father deposited in a bank before he
died.

I want to assure you that this fund is legally acquired by my late
Father and it has no criminal background. My father legally acquired
this fund through a legitimate business before he was poisoned to
death during his business trip. The death of my Father was suspected
to be planned by his relatives who traveled with him during that
period of his business trip. Because after 3 months of my Father's
death, His relatives started claiming and selling all my late Father's
properties.

My late Father's relatives are not aware of the US$6,500,000.00 (Six
Million Five Hundred Thousand United States Dollars) which my late
Father deposited in the bank and my late Father secretly told me
before he died that I should seek for a foreign partner in any country
of my choice where I will transfer these funds for my own purposes.

Please help me to transfer this funds to your account for a business
purposes in your country. I took this decision because I have suffered
a lot of humiliations from my late Father's relatives. Presently, I
have had communications with the director of the bank where my late
father deposited this money. I have explained to the director of the
bank about the urgency needed to make sure the fund is transferred
abroad so that I can leave this country for my safety. The director of
the bank has assured me that the fund will be transferred as soon as I
present someone who will be honest to receive the fund on my behalf
for this purpose.

Please be rest assured that the bank will transfer the fund to your
account and there will be no problem. This transaction is 100% risk
free and legitimate. I am willing to offer you 30% of the total sum as
compensation for your effort/input after the successful transfer of
this fund into your account. You will also help me to donate 10% to
charity organization and motherless babies homes in your country.

Please all I want you to do for me is to stand as my foreign partner
so that the bank will transfer this fund to your account to enable me
live this country. Please, I will need your urgent assistance because
of my present condition now. On your full acceptance to work with me
regarding this purpose kindly indicate your interest by replying back
to me so that I will give you the needful information and the details
on how to proceed further, i will offer you 30% of the money for your
help and assistance to handle this.

Your urgent response will be appreciated.
Best regards
Kofi Aya
