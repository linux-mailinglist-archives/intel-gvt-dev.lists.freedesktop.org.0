Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59645A04C35
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jan 2025 23:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45010E26D;
	Tue,  7 Jan 2025 22:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GvW9NHNI";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BDC10E26D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 Jan 2025 22:28:41 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-85bad7be09dso8328849241.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 07 Jan 2025 14:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736288861; x=1736893661; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GK+HIaB9gocXUGUHW+w9xmamuwdQ6IyDCiwvXDCYPyw=;
 b=GvW9NHNIydPkyYtqFCzBI9Nf8vvMNGXAMbrOUgGnBAl1dv5EEj8OE4733NMMHND7wa
 oyDQa9VKD/jMSgr/iA5ijMfzHmo6Tc44h6H/OtwHvhVAoBq2yH95KEQF1xr3aKlX738O
 RFFCRPVP0v7MN9pQ6uP/TDPZ93O0MUiuu6K0mYSaiLpt9YaYk8OKHfX3+ZCWcMRmGO9L
 /mij2sSZ8M+bgALL354O8XxH4wQXAEr1geCvGfvMMrWPs5wskJPOoYxJj7jnCHR3gKaT
 +kc0/wa9z5p/SF3JCjctn+aw4BgIzIYXP1qM5wEFz11X2rOsYP0PRyuehT/kDNinSaS/
 Mitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736288861; x=1736893661;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GK+HIaB9gocXUGUHW+w9xmamuwdQ6IyDCiwvXDCYPyw=;
 b=bajCPoNQ5x8igNolMlNwUNpO89zeV/Omk3IxrKGQtwbgs/inv/VhWLj726HQzpplg8
 v6B/uEvIBqbIxnQLxZ7AN4CqXT3VRRr/wlRU1twgrOntenep6ncjhl2DLV7l2krCzDNb
 C86MFEh7XRqgcECK06ic4D2bY4oueCB8x7hzhEwBJ4jRUILOO5fKFEDZX6IIyJ+U5xtw
 taYi21fY4sBbff05KXPppLGGPeLKUHgCsw+/3p8SoNBTNq/SAzhVwxjFsFtcI01UtrGV
 UUJL2P8+Tq5uGxXtUp7OCQHu2YJZdi0Z9iwFFtNTPiV7TSQzXyUzgIbE1aUNucVLMmys
 Q/iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAZOo4M2gzE1HwgnOnxlmtM0eSuNZpWfMiGLO+1Ulx9ENdHjxx7UVnOK4aNqFUoY4ovJDHZ7LIn+sQmePS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3C8CR42TRXYoWVOQukIMtXDMGjfecEIfXyVdYD498r4e1LqHS
 e0wFWKGbj2OHgjed1wUAE/eVhgrvVQdVl47Bzwl+MjRyJJGPDSErTM/wrT1/uXCXy9zg1T1fAX7
 mQQExJgtol5qzJHPK9kTyJjlLxZQeE86fnu3Z/5k5
X-Gm-Gg: ASbGncvyNWyfTBLBuGh52D3N5EKbbqD7dbo6hnVxmvuTd8NG4vXjIX7kPjMoTUs3MON
 ykKLQqHNk0KldEBYgAj4aMnfn3kKZWmvpTk5W
X-Google-Smtp-Source: AGHT+IE3ajRlQOAuWurXGUgRCJAJ0B+UGQoknpuVqxcBQzymCDCvpd0Gkm63rWdWhxr2ZY4IilUVo369XST027D5+5U=
X-Received: by 2002:a05:6870:e2cf:b0:2a3:c59f:4cba with SMTP id
 586e51a60fabf-2aa066d5b3fmr197586fac.17.1736285012735; Tue, 07 Jan 2025
 13:23:32 -0800 (PST)
MIME-Version: 1.0
From: Office Manager <omanager733@gmail.com>
Date: Tue, 7 Jan 2025 22:23:21 +0100
X-Gm-Features: AbW1kvalfJe91ZeR7gZ65fmkwFiiI6V-PXo6YKLWAF2M8uvCAkNouSCnXhdEhUI
Message-ID: <CACezfqkwDts_Wt0Mp0Wji035SSRr6HYK-ZCE9oCUq_-M0oOiqg@mail.gmail.com>
Subject: HAPPY NEW YEAR
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000069bf26062b245b15"
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
Reply-To: mkwame010@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000069bf26062b245b15
Content-Type: text/plain; charset="UTF-8"

Attn: Sir/Madam,
How is your family? This is a business proposal with a legitimate standard.
Some funds are in my position in UBA BANK with enabling conditions for
onward transfer for your country. I have contacted you personally not as a
matter of choice but of necessity. Therefore,  I am seeking your assistance
to carry out this fund transfer legitimately for your country. I am
intending to relocate to your country as an entrepreneur.  Your Percentage
is negotiable. For more information, Send me your take at:
mkwame010@gmail.com.
Best Regards.
Dr. Mike Kwame.
Head of Investment, UBA Plc.

--00000000000069bf26062b245b15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Attn: Sir/Madam,<br>How is your family? This is a business=
 proposal with a legitimate standard. Some funds are in my position in UBA =
BANK with enabling conditions for onward transfer for your country. I have =
contacted you personally not as a matter of choice but of necessity. Theref=
ore, =C2=A0I am seeking your assistance to carry out this fund transfer leg=
itimately for your country. I am intending to relocate to your country as a=
n entrepreneur.=C2=A0 Your Percentage is negotiable. For more information, =
Send me your take at: <a href=3D"mailto:mkwame010@gmail.com">mkwame010@gmai=
l.com</a>.<br>Best Regards.<br>Dr. Mike Kwame.<br>Head of Investment, UBA P=
lc.</div>

--00000000000069bf26062b245b15--
