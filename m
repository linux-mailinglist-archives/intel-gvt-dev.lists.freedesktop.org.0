Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE25894B9
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Aug 2022 01:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455138A951;
	Wed,  3 Aug 2022 23:11:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5C48A9A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Aug 2022 23:10:31 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id w185so17806535pfb.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 03 Aug 2022 16:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
 bh=hMyNwjevD6sgXioM6PyIq1u9V3EDveQoK5BZPQ6l/9I=;
 b=ov8CddIEX2Sq5/14lzE6BU6sCS+wq7TPX2yA3QRd0PBTzqwE24pvIGJ6nYN9+zPTBt
 hz8NPVL22wZyTuR8ijJJ4X2E7NnOsqN5HB35yDJVFR58LTaQ7GVo1G6r3m5HxsTgKo80
 H6kXRxFYX0dkQsQEu1FvYIaZXwBuTnYjo/NKGi0BBbVf6RJrl0b8r0kTRLlUYfka0phY
 WVAZtvopXoLEXpT3aG7UDcvV4S3N+i0DpE4JZgSOO1SzcnpSJECWuE7Zp7KYgsEaLojJ
 JhtQLYFuRj2YGZkyTt29bm8cNg6ia7g4te8OeHhp46Ya4zmCFc+62OAT1grFYhdCEW/N
 08LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc;
 bh=hMyNwjevD6sgXioM6PyIq1u9V3EDveQoK5BZPQ6l/9I=;
 b=a/QTN30GQo+DVd4wtBwFAt7ErDPp7mORGgg/Pv7tKFDTsd5uIb+5jWgPQ3hV4Iovyf
 Zypq/d29zwlRHxpKZ/mFkpRaTdqLXY01oH0xFivcl2clAfOVRAVivhxmWm1a2DOS8q5K
 4zj2//BKDi7YUhS7i1DwOg0VSYa37BJ9hNeOoVtnz/azpdICXNMQD58pttr389PNG0SH
 xx4KUPMorpK67jC6PHdBl/+vo4TJUuOJ2r7SkBIY9WNF6EQ2+LJUJVniRCATv7LPghUv
 G8em6OU66iOssJYdgdkmLiGAhd8Av8ALuJMuyaJgI83Lqu12YhaD27I9yPCf/1QI0+o1
 yoqg==
X-Gm-Message-State: ACgBeo2w7H9Xt47ZgXodVn6ZOIbc9z1dJnl4pDi9EVLz4P53I3rBfnse
 l/oWK3Ct3KdRVtZOpK9bN5UC1srT+mwrHTXJRZ8=
X-Google-Smtp-Source: AA6agR7x1CtPG2enO4mZdQuMEGV+ZnkVksYRdw0FQtDmBAHlPrcUaP74UeZtcBRLeB8LSPy6u4Pbys34r4zic9ePZMM=
X-Received: by 2002:aa7:9083:0:b0:52d:2bcc:709 with SMTP id
 i3-20020aa79083000000b0052d2bcc0709mr21131709pfa.71.1659568230626; Wed, 03
 Aug 2022 16:10:30 -0700 (PDT)
MIME-Version: 1.0
From: oil kj <kjoil4433@gmail.com>
Date: Thu, 4 Aug 2022 01:10:18 +0200
Message-ID: <CAB52mTXvymBKioUD_AJBkmztDFSQy_xi1fo_T=0sF=4DOyHMUw@mail.gmail.com>
Subject: hi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000ddf9a905e55e56fd"
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
Reply-To: jkirinec101@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000ddf9a905e55e56fd
Content-Type: text/plain; charset="UTF-8"

 Hi,
So sorry to infringe on your privacy, It's said that 'A picture is worth a
thousand words, but when I saw yours, it was more than words could explain.
The charming profile is irresistible, though a little personal message but
your look tells a lot about a nice person... In fact, I was looking for my
old friend who resides in your country and that was when I came across your
profile and I decided to write to you. So I had to drop a message to the
charming person with this great profile because I believe it's curiosity
that brings me to you in a time like this because I felt that both of us
want the same thing.. Just want to know you better and be a friend or more.
Once again I must say that I am sorry if contacting you contradicts your
moral ethics. Hope to hear from you sometime soon.
J. Kirinec

--000000000000ddf9a905e55e56fd
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">













Hi,<br>So
 sorry to infringe on your privacy, It&#39;s said that &#39;A picture is worth a
 thousand words, but when I saw yours, it was more than words could 
explain. The charming profile is irresistible, though a little personal 
message but your look tells a lot about a nice person... In fact, I was 
looking for my old friend who resides in your country and that was when I
 came across your profile and I decided to write to you. So I had to 
drop a message to the charming person with this great profile because I 
believe it&#39;s curiosity that brings me to you in a time like this because
 I felt that both of us want the same thing.. Just want to know you 
better and be a friend or more. Once again I must say that I am sorry if
 contacting you contradicts your moral ethics. Hope to hear from you 
sometime soon.<font color="#888888"><br>J. Kirinec</font>



























</div>

--000000000000ddf9a905e55e56fd--
