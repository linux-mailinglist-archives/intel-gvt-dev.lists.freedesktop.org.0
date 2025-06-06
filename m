Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780FACFE12
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Jun 2025 10:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AD710E982;
	Fri,  6 Jun 2025 08:15:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.ventrixio.pl (mail.ventrixio.pl [57.129.137.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967C510E982
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Jun 2025 08:15:33 +0000 (UTC)
Authentication-Results: ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=ventrixio.pl; s=default; a=rsa-sha256; cv=none; t=1749197728; 
 b=LVdrmtUxyDJKF4C8tBB5cwKJOH92UQoK5Gl78ag3z/KlmEyNju6tfvODxcYSdonjyeVr
 +i1sV0mJyw2KtF3WqaT5PKopD4Go7lSWdx9ZMcZYAiozeg54bayVByghWw14DVKdOSYSj
 B0ububB5hRSzqS03dgG1xb+jRJ/YgKu4Z+9faKhlFRXTNuGH5/OYSvTB0tU3/wWBDUm9O
 F2mWD3+A5mDyajFCU2sAHXPj1lI7uuhLMEpJPTCLzgz3EHudzA39+pViGMXXvqHf9ZXF5
 xbn6pL8feI62Ad32klUDMOv3SvOJJqNPKiJEUTh3tg9Ssljts+RVjXyQC4+a+ZjZh0Q==
ARC-Message-Signature: i=1; d=ventrixio.pl; s=default; a=rsa-sha256;
 c=relaxed/simple; t=1749197728;
 h=Message-ID:Date:From:Subject:From;
 bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=;
 b=YUd/qj7vBi6Vakb7KD9tyAOShxsYJIubWzxxB9omR3NEEVj/nwuJEY2CLz0t6+j92zfS
 RfB0ivZuYjWXMvdrhtlrh+PyhouBoSFUOxLSoM1luekdPNWJ2e/8BJO29rnZLLYzcEAAb
 6kHiSwyO3NPWB2IluwPWYNHgoSUoDAL7Hm5vEhY5ykZhdBipRy73XExdvozMhfUCJVJ3o
 redIj9ZHIlSshb6Dre3CxEE91LaC9+67GBgj4/e2CDUudYBxppgd1onFwNjn/OZl61pyz
 xU/QPhbkwTOZEeqkFSWN1EYStTMJcZK4kBr32Wx06CTqpCRpUOyR+CIQv8+p9JQOpQg==
ARC-Authentication-Results: i=1; ventrixio.pl;
 arc=none smtp.remote-ip=127.0.0.1
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
 id EF22723FE8; Fri,  6 Jun 2025 08:15:27 +0000 (UTC)
Received: by mail.ventrixio.pl for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Jun 2025 08:15:26 GMT
Message-ID: <20250606064500-0.1.2p.ujik.0.70acdf8tj4@ventrixio.pl>
Date: Fri,  6 Jun 2025 08:15:26 GMT
From: "Karol Bednaszewski" <karol.bednaszewski@ventrixio.pl>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: =?UTF-8?Q?Mniejsze_wydatki_na_samoch=C3=B3d?=
X-Mailer: mail.ventrixio.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe umo=C5=BCliwia tworzenie =
planu tras czy dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Karol Bednaszewski
