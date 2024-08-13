Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52A950A60
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2024 18:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0CA10E38C;
	Tue, 13 Aug 2024 16:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h4RGhJXB";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1310E38F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Aug 2024 16:39:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-530ae4ef29dso10503884e87.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Aug 2024 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723567163; x=1724171963; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=taCo+IaG7H7TXnK2DMviAAmdW+/kJKhc00GgSFnsywU=;
 b=h4RGhJXBWOzZEMwWORn9RxGxzEr7YbYCns6ik5U5ecMPyxiJJUf3r3IlEXeRjCTbqQ
 Stujr+yxCLOL0gw7vAvlTynLx37Lads5Us5sFbZHyjNC+Jxk080yenU6MP6GhFUcQKBh
 lKYenpt1br6RiCfiUYknE0fhWYG5Y7/nhJDI7vyAvYEyRORkv1sxC32iDG82pPkI81kS
 sdA28/FWaXhWYXxKPZ7PIh4xrla/2yf/y8tW93gXeK72RlsCtUrtr85yjQWP8R7g7fZF
 DTYveA5tPoxPk8TReJKI3fVDsKxIytYWpDvOKrX+hg3C7B7G5bQVvj7gswOL2iKcDi0b
 HIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723567163; x=1724171963;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=taCo+IaG7H7TXnK2DMviAAmdW+/kJKhc00GgSFnsywU=;
 b=f/gtSYA13crRmhtCdDfsePKkh83CSdcsJvamgzunKSA34FE3t0rI4xNO2Xo6Vgt2C8
 QgLiRC8RjXl+bqc5Lf/GsFPna/FZ5twmQK50x53wlzRzOCd0N3Vw5z+8cPezNlsSEsGE
 qMDD0yi6zfYLjCXkAwrVwVCpU/rAy9CXhEpbtm1IaaOV9Ijf4+qg7iGUSCHFslB5NMTg
 jOMeeaxL61QPcaGKXnwQq/BZiIzEyT9UqGCGdVLJVeAJBHqC+ESQdwgyFTL0wrLK509h
 Jv6OCkYpMmo13S/835sdGSXrn0r7+ZYNZrjloSd2hpoV5sYIc3GHadoitGmi/uMB09EE
 qcIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbWqgHSaAk11Qs7gFy4goRl0VCjlndCx0kqc4K8AaomZxrT6lcdB42n6WyrcdVK2k4lMJ9vBlNMpEFgJ1TMksr6YWsfCA67qx+x/PpdjpYYzcM9w==
X-Gm-Message-State: AOJu0YzXU7lKx6yWKfyIH/59kdGK4anaxNt7OdFxjMXZDkOA7GTNVE2w
 +O2KGtM5pXbmzfhG5n3qWQ0/6a/DyUSAKrwRZjQs1fdJc8T6TFO/GoIfx0gVxOhA9k+eocMSxlp
 ZP3atNZVrER4MeTh/ZRaoSB1qiaA=
X-Google-Smtp-Source: AGHT+IGriC/sWDSaJOsPMaTo6ZVT/j6G02D7DyrIDN5Uw3wqWOucW76Janoz4hYY3O0H67S8NdiKrn0iXo0e/IvNU6I=
X-Received: by 2002:a05:6512:3b9c:b0:52e:a03f:ef53 with SMTP id
 2adb3069b0e04-53213659736mr3646453e87.24.1723567162395; Tue, 13 Aug 2024
 09:39:22 -0700 (PDT)
MIME-Version: 1.0
From: Yousef Ahmed <contactdreik61@gmail.com>
Date: Tue, 13 Aug 2024 19:38:24 +0300
Message-ID: <CAEnVrfG4vQ8tPK9TScP-adQJwUS7FDvVwMzt3bxja49V5EPFAw@mail.gmail.com>
Subject: Make Contact.
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007616e0061f9340fd"
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000007616e0061f9340fd
Content-Type: text/plain; charset="UTF-8"

Greetings,

We are looking for project owners, who require loans for their projects. We
have finance available for your projects with over 2 trillion private and
corporate investment portfolios. We are looking for entrepreneurs / project
owners who will pay up to 3% interest annually and we also give a 1.5%
commission to brokers, who bring project owners for finance or other
opportunities.

We are also sourcing for a foreign direct investment partner in any of the
sectors stated below.

Energy and Power Sectors, Oil & Gas, Agriculture, Acquisition, Health, Real
Estate, IT, Technology, Transportation, Mining, Maritime and Manufacturing,
hotels etc. We are willing to fund your projects.

I wait for your response for further details.

Regards,
Yousef

--0000000000007616e0061f9340fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<br><br>We are looking for project owners, who r=
equire loans for their projects. We have finance available for your project=
s with over 2 trillion private and corporate investment portfolios. We are =
looking for entrepreneurs / project owners who will pay up to 3% interest a=
nnually and we also give a 1.5% commission to brokers, who bring project ow=
ners for finance or other opportunities.<br><br>We are also sourcing for a =
foreign direct investment partner in any of the sectors stated below.<br><b=
r>Energy and Power Sectors, Oil &amp; Gas, Agriculture, Acquisition, Health=
, Real Estate, IT, Technology, Transportation, Mining, Maritime and Manufac=
turing, hotels etc. We are willing to fund your projects.<br><br>I wait for=
 your response for further details.<br><div><br></div><div>Regards,</div><d=
iv>Yousef</div></div>

--0000000000007616e0061f9340fd--
