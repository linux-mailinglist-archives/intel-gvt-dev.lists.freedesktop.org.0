Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF3825E92
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  6 Jan 2024 07:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050C910E187;
	Sat,  6 Jan 2024 06:47:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F086110E199
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  6 Jan 2024 06:47:40 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78313803243so15485185a.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 05 Jan 2024 22:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704523660; x=1705128460; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJZj67CVcoZo2NOM9grXgYVpcLIS0wDzAi6s3dvuSGY=;
 b=Jjdc+x0CD6mWqC9fw7Y3mEr4v0q6Mk181ZWt/eG4uJ4uWHl8/o/7r2W/0nK2h6RQD6
 P5M8bozf8982iOPxownFO748pSJ+/7H/VqofmPrlzNbL3YbadGz2606L8ap/LSWBniE5
 jjlWD/9orHU2IpV/6XfyuyFpYxNIabVFtKGjtWCUAyH2YZyfmdtiPcDY5w6fl7j3omhK
 l8tHzPsDkntPgBLPX8iHWjonxJTapnY2lYNeHIh8IeKX2fXVrBgNmoo5/M+q8trByNgH
 VP+WpvKfko8QIXdwHwzH71sTuZm1EGCJpMxq0Lx9gJk4faVl+g2ziVoM9oajIg8/ou1s
 H5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704523660; x=1705128460;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJZj67CVcoZo2NOM9grXgYVpcLIS0wDzAi6s3dvuSGY=;
 b=snpruGWALaTa+w6CdpSGrkaVUppA9tn5HNfzP8GaX+TIHP5lAnMREEhfHaiLpAbqGI
 LQ4V3Z7dxDB+4kyElb60w77/k2OObAIr37rzn5tvrokDdFh+AxNcU6SUm2A28Crnlvv0
 l0bsi7E5b4PkLYwXYjjG4GthHdXiSdDpkd657TpWyGbQt0/9klZl+K3r2rNQwLXn2mCr
 DOfJcaMlhtljqvt4ZJpCC9ufBimQCtlsR0l4D18XqrAYxVLeU5BKcLaMaawJBamuS6M3
 M66ilzYO8l26x90EgZoz9rsyLAWgc3FZdNMuJb4giHeKwkQ2oPxvsNb1VcDQZOnepvSf
 xpZw==
X-Gm-Message-State: AOJu0YyKuCFDWUdKan1t+8n7XzXAJLcy+ASJ9IB29mOfzfrhZcaNTttJ
 GGXZZzMIcJ2rBk1/hShzdbvt5zMT3AsmW0obDq8=
X-Google-Smtp-Source: AGHT+IHTYoV2duKWm4ETCk/70BZv+JEe8k/jJwDcS/fpXSolpjle0KZGMWyLvcZboiz8jP6otpEpMpnVuz6NI8Nql5Q=
X-Received: by 2002:a05:620a:2230:b0:781:e95a:725d with SMTP id
 n16-20020a05620a223000b00781e95a725dmr640784qkh.151.1704523659793; Fri, 05
 Jan 2024 22:47:39 -0800 (PST)
MIME-Version: 1.0
From: nina coulibaly <ninacoulibaly10.info@gmail.com>
Date: Sat, 6 Jan 2024 06:47:28 +0000
Message-ID: <CAMnOr-pBhDKzC6=cyqCxWr23tL0Jf+5R40PSGsbuchXCtAEKgg@mail.gmail.com>
Subject: From Nina Coulibaly
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000040d85b060e41574d"
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
Reply-To: ninacoulibaly03@hotmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000040d85b060e41574d
Content-Type: text/plain; charset="UTF-8"

Dear ,

Please grant me the permission to share important discussions with you.I am
looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs Nina Coulibaly

--00000000000040d85b060e41574d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature">Dear ,<br><br>Please grant me the permission to sha=
re important discussions with you.I am looking forward to hearing from you =
at your earliest convenience.<br><br>Best Regards.<br><br>Mrs Nina Coulibal=
y<br></div></div>

--00000000000040d85b060e41574d--
