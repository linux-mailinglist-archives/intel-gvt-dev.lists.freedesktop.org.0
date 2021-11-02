Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B17442925
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 09:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E086FD14;
	Tue,  2 Nov 2021 08:12:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F66FD14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  2 Nov 2021 08:12:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f8so51408519edy.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 02 Nov 2021 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=biBT+6K7smNl9ddUl8qSTBHMumKSohEcS1pWRSxKZmc=;
 b=g6zYr33A8szbHq/JSA2dHKx0sGxsLnB/bN2UmGGbIte6ZDE3rKKspFl+L8EDSwfIV7
 yTyyq7otOxOZL8jKp+6ZKyiGfpx/I24tF8+vrLUdc470gS6B+lWZQfqRRbdO44hpt52S
 UOXzX6HJwpekrUzVqj9qcps2Ceb5Bc/x31TF3oqDvMTGuLw5H52aLYfNdvQogJAo+GSE
 PKjc47pBdKC3hlvCZaTcsHZm2Ech7kufwaFR7CibCOdLbxrVhZW9GP5ok0T1jMvzfHfF
 PVHKkJwwQzK/HNwT7xZrDnTzs++XezPtIpzHYoj111PCxIbAqP4J6GAH2714jF0Psw/+
 +LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=biBT+6K7smNl9ddUl8qSTBHMumKSohEcS1pWRSxKZmc=;
 b=V9YLBi08F1wqEkTPCjRtdbbpk37p4HgCt0J5rj9fERP7Vt2pP9wb47DzosNfIWdbEf
 /0jiBS+0oPDtb3Cjg8iCgpnm4wbqrhHX2cEqryM0l93X0DrB7D799bs5QbKUwM2P5axw
 q51xq37XQkOlPFpwv/n1ZzritqQ+8YU0Nxgil9AMQ45h1ACb4u0ckOdOsbn/cbTy2Sfk
 lrVLq+cMniXNQh466AGNY2oU9XFphQMIaFSuCWGTmri229ZKmTUlar20BnX+A1p3J/xu
 m7SK4Y+TOw9ayE5+zSK96MIsih8zcslOwGWNxravhukGI1G5wspq6x0jmlVEOGA+yoGg
 /fag==
X-Gm-Message-State: AOAM530yYdQ8HunKi2eM3oXKfcoKCpLnILH8LPK6/mrFI5a0q2iczOoh
 mk3QqsAWUddkRLaGExz2WMeqiBv4P94sdFrlpKo=
X-Google-Smtp-Source: ABdhPJx7KrgqZWyj2SetpoqS8sFU2ye7EMF+27uevc6cI5poLK1Vr23Y8zb8e7PWJM8ctFL0Vu4Tpw921YEeD1NcoNw=
X-Received: by 2002:a17:906:3d62:: with SMTP id
 r2mr42025859ejf.174.1635840762838; 
 Tue, 02 Nov 2021 01:12:42 -0700 (PDT)
MIME-Version: 1.0
From: Comp Dir <compdir108@gmail.com>
Date: Tue, 2 Nov 2021 10:12:30 +0200
Message-ID: <CAOwTP_5RmNVuMQx6Q6-9KkKvPwNrnc22Rs72BXZB4E_7FaiP+A@mail.gmail.com>
Subject: GOEIE DAG
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000094051d05cfc9db02"
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

--00000000000094051d05cfc9db02
Content-Type: text/plain; charset="UTF-8"

Hallo,

Ek het hierdie sakegeleentheid -voorstel vir u wat ons sal baat; Ek sal ook
daarvan hou dat jy dit sien.

Groete,
Frank William
+27 64 980 4011

--00000000000094051d05cfc9db02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hallo,</div><div><br></div><div>Ek h=
et hierdie sakegeleentheid -voorstel vir u wat ons sal baat; Ek sal ook daa=
rvan hou dat jy dit sien.</div><div><br></div><div>Groete,</div><div>Frank =
William</div><div>+27 64 980 4011</div></div></div>

--00000000000094051d05cfc9db02--
