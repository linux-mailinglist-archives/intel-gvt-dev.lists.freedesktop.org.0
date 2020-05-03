Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73821C2D28
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  3 May 2020 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2856E255;
	Sun,  3 May 2020 15:00:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8CC6E258
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  3 May 2020 15:00:58 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z2so9682948iol.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 03 May 2020 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NbnYQBMbCFH2fiBch/yBDq0jiarN16SZNVZ+05GPUNc=;
 b=QHm2tfSZduQrvJgwf4AB03T7wyxey+N5IJPUpip1hCZRloePlpbYhE7YcFb8xmfJNC
 /NL2tMBDTU3SNiCl2wH5eGNLj9309I5UKP2wWFkg/SOnjyyS+D4JRdOyAGD9ld2HX2xF
 Fw+2cxlH4+RjRBk7qWTROVgnggsfntJJLJFzwxmOG5xEWMOAXuDcZVSJH1xVPkBml55j
 8SmUz30ltiFLsQqNHeR/ivpuagwwy5wtSPf6cUpueV98UnpbTnDxJfnmvZ9xhBT+DUxk
 8TguffSQHBdKu+GSfKOoa6jiIA+oM6oTGIM57I2+3VHppF5yvhEmSWvZ/2kXIcUYSToh
 9lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NbnYQBMbCFH2fiBch/yBDq0jiarN16SZNVZ+05GPUNc=;
 b=QvZEFjLnj2YhGydIqSAUXNzLBbngEn8AFcSoJ+hIa4XI5ygi9MBMqOAuhz9LaIF5q3
 4hJkKLeyZ3YvlcYG/PJq7K4Bie3OEvFErjLYPqFlD6eV7ByaORPl6gGpN0AwuDFwuvIn
 q/OPv8Xa2fZ0VEOUw1ODJ9MQqnRZ2+X8KPLk5+X5F70jqQWalwfWvQeJedQTOxfldIIM
 FJDbW8XxAeqrtnlGZ1XDruShBqjv7Hxki+LI6SrWSsfO+Ub8WKVKxdRCI+/owmj+jQ1M
 vMxD8bDcSVEelxxdqheubHjDt34VSqFFFmgWI9jhvh5eBUB/XezXGlcOKzQo5+L0S6bV
 C09g==
X-Gm-Message-State: AGi0PuaI9oHu5kHU1x2Uzv42wRcx2WNWVzvwmqWmptnoWlrYUoS0trkn
 2qmTbPgBEw2a7oNdmOf3io6kzY2huaez5zeKNv/TXgQEtP1HkdiP5d4=
X-Google-Smtp-Source: APiQypJ5fo2aaORxL5i8tu7+Gtc+DrJxhsiX+GMlzh2XoQLPBEHlyvfMOO8DKvpgtSB3nc50OIGo6QfIv51AM/0YTa8=
X-Received: by 2002:a6b:5507:: with SMTP id j7mr11403692iob.90.1588518058170; 
 Sun, 03 May 2020 08:00:58 -0700 (PDT)
MIME-Version: 1.0
From: Amelia Ibrahim <ameliaibrahim520@gmail.com>
Date: Sun, 3 May 2020 16:00:47 +0100
Message-ID: <CAGtvjUh-AJ844ZwOa=tUunhQu_YqsGZ5=Kj846JFRgbqkqgs_g@mail.gmail.com>
Subject: Hello
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
Content-Type: multipart/mixed; boundary="===============2037386307=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2037386307==
Content-Type: multipart/alternative; boundary="000000000000939fc605a4bfae08"

--000000000000939fc605a4bfae08
Content-Type: text/plain; charset="UTF-8"

Hello, I will like to talk with you

--000000000000939fc605a4bfae08
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hello, I will like to talk with you<br></div>

--000000000000939fc605a4bfae08--

--===============2037386307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2037386307==--
