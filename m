Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8853E161EE5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Feb 2020 03:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2CB6E10A;
	Tue, 18 Feb 2020 02:20:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45546E119
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Feb 2020 02:20:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g1so1171282wmh.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Feb 2020 18:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sSb6iGdmsh81Z/MxkLlbOLDZfL4UytYywaCENbY6uJU=;
 b=sbju3OWVnOIaY0zjvW4Lu4Wxr4kIF7I1DcDOfdUxuels6gnXIqDUdQl+4J0WmVZKH3
 WX7Z63SGc/SEjRpusGgQhC8GttWbPoxNi686wr3dZoOvJpfJuy0mS8uWhaGq2FIbE0YH
 LSr8EAUc72RCleIZEiT4OvszYIZaoSYOmEdHFmZ19d5d/JOWIbeaVUcKPcUM7XhCs36h
 lp0CzJyrR+33Pz9IJp3jkyGrig5dnhraDH1+dYxiPR34RoHa/hEFzAGjSSR20whscqrG
 GcJswDtyzMtxhLdMy9crhRap6M8aSUKLWdjhTkXSFED/8gKzoPZzEBLQBU4DOpXOFxol
 n/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sSb6iGdmsh81Z/MxkLlbOLDZfL4UytYywaCENbY6uJU=;
 b=JqO71ecggP0ilYwNokimDButaKpCClKZfrWl5lCTI+NzYFtsgLeqX/caMk3AxyfU/2
 nc5TtasEypQG09aKIj9hsAjujv88YFL9D8iWk24qJJ5bjJ6hx+PvVw2ruxsw0BGpa9IZ
 RZz5yavPLZh0p7hnFxPTrs5vV8dc6sNXX5WAyc8neMqFe+mT1XFpkZY/aASrm1MUya0/
 ljjgbCveauM2FoIeR6ampQ1zs3UadMqwz8t1+Z5JaVKSpGzJPzsOg0Zt34nKD7kVTjXJ
 74K31V+yg36VlEBegtEcDxkzxO0yuFghux4zODx31vXOU6uyMva3mDMuleS9eHXAOsIX
 pHPw==
X-Gm-Message-State: APjAAAWob7MyzYsA1LepENAabClDwoIqpSvJgVKB5y/xoxOQy5BvrXH3
 x/NyKYXbUSM4gCWCZYCdv23kRkg6U9DPscYActc=
X-Google-Smtp-Source: APXvYqxcOxDZRYQieySlKh+E3/UPoNo2z6YoNlO3GKYNAZSBiqid63Ks8c0G3ej3ceinLixzqMJ7gT25euP/cS8Xw60=
X-Received: by 2002:a7b:c450:: with SMTP id l16mr2194802wmi.31.1581992434376; 
 Mon, 17 Feb 2020 18:20:34 -0800 (PST)
MIME-Version: 1.0
From: Marvella Patrick <marvellapatrick1@gmail.com>
Date: Tue, 18 Feb 2020 03:20:22 +0100
Message-ID: <CALCFPMXa=Dnw4+bFGECYfRnkrZqY0PF5WOriYN4ehGRdsEQpsQ@mail.gmail.com>
Subject: 
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
Content-Type: multipart/mixed; boundary="===============1602020124=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1602020124==
Content-Type: multipart/alternative; boundary="00000000000016a1ef059ed051cc"

--00000000000016a1ef059ed051cc
Content-Type: text/plain; charset="UTF-8"

How are you doing today

--00000000000016a1ef059ed051cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"=
color:rgb(32,33,36);font-family:Helvetica,sans-serif;font-size:22px;font-st=
yle:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);display:inline;float:none">How are you doing today</s=
pan></div></div></div></div>

--00000000000016a1ef059ed051cc--

--===============1602020124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1602020124==--
