Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FD5443CF
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jun 2022 08:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9FE1123E3;
	Thu,  9 Jun 2022 06:31:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770321123E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jun 2022 06:31:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m26so19526933wrb.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 08 Jun 2022 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=WVkjW0aKAhsKcJxT2Q0LAzeYj9dX9Z9lqdqo1a6nCMI=;
 b=TfVU5dckxNMDdD/P0Qk2H6ouhMQZ4/m4BJoDD3jfUjXUyGeWBghuY8spm8mxmOY02N
 4McRoYNnlULaWa1QB8y0l8EVEzQP77iUrHgC7gtT2v+uEn8KJb3aMJbhHXb7rKLJ4OyH
 AJXjhFto362p37rZDogiHk6MRSYtbetAqSf3JIo21iRHSCNHgcjO6NGr0G89ZwPSwpmx
 NUNBZapKpAz32K8kyQEAKh12RQ7LELL4olE4L10+O6LoPXw+gccp3tz6dS25B4qNOgY2
 ImAk20fDATiaGl28SZuMbuqM7kvBUJteN+hcYAiS8xB8t6szLNpfL1uBvcRjyo574HLa
 iVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=WVkjW0aKAhsKcJxT2Q0LAzeYj9dX9Z9lqdqo1a6nCMI=;
 b=mf+EnM0VHp9ZHC6ExjdbTXeR0Fzfe5gVvhtTwBgJGGOl/M7Rc2iZ363r0BS2TG2yuL
 p+bpCA/jwRFJ5i/PyMQ5InbcCWmvcAcRrlxlqGN5UW0DbVZO5CAnzOLNAUMFy6vH78XY
 QYmpsvlF2aFTiJ2aMnzYFV5iPiOPo21pAMnZAxE83DPLXnPX+CJrVO4F0iRP84qX+181
 jo+JNG0un01N2tKQ0IXGrnSo4BAgSObLXXbEtT8gnwF25Dvynpg7dk1gdY2kHDuBc8L+
 PGZh+b65aMvDUUsq01nJYXl7VWMNlTk5Dur0+u2QgxqPrquEvfGMRedCM7cmDe6COrNq
 iUIw==
X-Gm-Message-State: AOAM531shNr4XQyHWM2PKhbcveE+EcOZmo97Gg1uasRhSYfw0ETdlfw1
 oZ9cO5CFjBcDofclFvLxVGrt0nnD3MkLM8ADW04=
X-Google-Smtp-Source: ABdhPJw1lPhQ6kpNmP/iWO7nEPwB+iZ1OgLKBeFUG3DbiSZomUVGWPk7KGRW5Gx+6yoCeUd4MOBaIgr2rZHNCtQko58=
X-Received: by 2002:adf:9b9b:0:b0:213:ba6b:5426 with SMTP id
 d27-20020adf9b9b000000b00213ba6b5426mr32150153wrc.397.1654756275931; Wed, 08
 Jun 2022 23:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:6ac5:0:0:0:0:0 with HTTP;
 Wed, 8 Jun 2022 23:31:15 -0700 (PDT)
From: The Illuminati <fbookwinners2@gmail.com>
Date: Thu, 9 Jun 2022 07:31:15 +0100
Message-ID: <CAA2kVTnjjaRhKBTH_id3h9-ZQrcQuSUhSJ_P2xn_ErXku68wYg@mail.gmail.com>
Subject: The Illuminati
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
Reply-To: illuminati01@europe.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Hello,

Greetings from the Illuminati world elite empire. Bringing the poor,
the needy and the talented to limelight of fame, riches, powers and
security, get recognized in your business, political race, rise to the
top in whatever you do, be protected spiritually and physically! All
these you will achieve in a twinkle of an eye when you get initiated
to the great Illuminati empire. Once you are initiated to the
Illuminati empire you will get numerous benefits, such as knowledge,
connections and also an instant US$1.5, Million USD, Donation cash
benefit as a reward to you for your membership with the Illuminati
brotherhood.

Note: that this email message was created solely for the purpose of
our recruitment scheme which will end next month and this
offer is for unique ones only; if you are not serious in joining the
Illuminati empire, then you are advice not to contact us at all. This
is because disloyalty is highly not tolerated here in our
organization. Do you agree to be a member of the Illuminati new world
order? If YES!. Then kindly reply us back on our direct recruitment
email only at: illuminati01@europe.com

Please note, Kindly make sure all your responses are sent directly to
the email stated above only at: illuminati01@europe.com  For more
instructions on our membership process.

Note: Some email providers incorrectly place official Illuminati
messages in their spam / junk folder or promotion
folder. This can divert and exclude our responses to your emails.

The Illuminati Fraternity.
