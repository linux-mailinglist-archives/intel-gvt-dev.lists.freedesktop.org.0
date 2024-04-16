Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D78A7711
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Apr 2024 23:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0C8112E91;
	Tue, 16 Apr 2024 21:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Do/AFS33";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CB910FA45
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 16 Apr 2024 21:52:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-418a776a4a0so4317255e9.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 16 Apr 2024 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713304370; x=1713909170; darn=lists.freedesktop.org;
 h=reply-to:date:from:to:subject:content-description
 :content-transfer-encoding:mime-version:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=;
 b=Do/AFS33dEaL5MJg33wYU/yo3T9ONIKQpq4S2jZSrj9xvV4n5syuZcrvFOV1nHOMVi
 SDcE30XmpfjoBaLyDyS83Af7fzSx2X3EvlHWav91RPSrkfAqJ0RmT+L5Xta38/6kYarF
 qaLBMLWbYdxW+W9alh7h43G7rEXkOxxnEP5a63gjvUKyFOGubqRBxqCMDuIxfty/RSAK
 ZY/OYomCoybVoUjiNoLSfZ8Edd/YHBbfKtOpk+jDdUkrGR9iib7BBeEWU+PBbFyUMdYM
 OWBgPXeQIeuRD7lOZnXmzkCXvJQUDwLeDTzswwjAxERnx1ck6xwcBB4ekXvo6I7WAHCz
 y3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713304370; x=1713909170;
 h=reply-to:date:from:to:subject:content-description
 :content-transfer-encoding:mime-version:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=;
 b=O5WwOtqPm09EGfFduyUr7dtNPWim1pRi1PQ/qCKGeKR1a18IFA6bhgOjkM0ogc39RE
 hDcD10YmL4sTDpOT3nU2yuAogJvY1jcndPsHAn6OOWv5Y4yYB6Fjvn9cb4z04EMVLs0v
 rL+CB6b2dYtg+LpouM4nH4ClgobaYgjmBdL65iVaWKNMTG0qebzJfjLw/asrK3YGonLP
 NY+9s6z/s5N1RXTMO/xJGhYYXcqyXwcECcN4QCtViRGmWY+LAayXwRJ+YAZwoJPkeUJl
 JZ6CLvmPKRehil7IteZxNRCVCPyaH/lHwKUR7hh3/tjpjlePeum9Jh9f3crp7AI5LMoq
 vi1A==
X-Gm-Message-State: AOJu0YysJAsMfyK+HbviDSDF4HDam+Pg9TKb68JvGTK4xM7qrDs952Es
 sxy2dqtpvd/4X9R5rxEMP6FeZ4eS3b/Amxmq1kSOCyt13r5Uyt+ypgqZ4gUWc3gTDDH/
X-Google-Smtp-Source: AGHT+IG6WuAthKLoo9zI1e+abxy4dXdbAUbK6IRzjyvfZ9WEZBYtFXduqY2h7VyBK9n3bQhPVaoAWA==
X-Received: by 2002:a05:6000:e86:b0:341:d6c3:5c4f with SMTP id
 dz6-20020a0560000e8600b00341d6c35c4fmr9965840wrb.21.1713304369934; 
 Tue, 16 Apr 2024 14:52:49 -0700 (PDT)
Received: from [192.168.8.102] ([154.120.104.13])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d4045000000b00346ceb9e060sm15063382wrp.103.2024.04.16.14.52.46
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 16 Apr 2024 14:52:47 -0700 (PDT)
Message-ID: <661ef32f.5d0a0220.b7a76.0c40@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Very Urgent Reply!!!!
To: intel-gvt-dev@lists.freedesktop.org
From: "Dip Paul Enes" <paulenes252@gmail.com>
Date: Tue, 16 Apr 2024 22:52:28 +0100
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
Reply-To: dipmorgan7@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Attention Sir/Madam,

I hope this message finds you well. I am writing to inform you of some exci=
ting news regarding the delivery of your consignment. Diplomat James Morgan=
, who has been mandated by our company to ensure the safe and prompt delive=
ry of your consignment, has just arrived in your city.

I am delighted to inform you that Diplomat James Morgan has successfully co=
mpleted all the necessary procedures and documentation for the swift releas=
e and delivery of your consignment. He brings with him years of experience =
and expertise in handling diplomatic deliveries, and we are confident that =
he will ensure the successful completion of this important transaction.

Given the significance of the consignment to you, we have arranged for Dipl=
omat James Morgan to personally oversee its delivery to your designated loc=
ation. His professionalism, attention to detail, and commitment to providin=
g excellent customer service make him the ideal choice for this crucial tas=
k.

We understand that you have eagerly been awaiting the arrival of your consi=
gnment, and we apologize for any delays or inconveniences you may have expe=
rienced during this process. Rest assured that we are doing everything in o=
ur power to make sure your consignment arrives in perfect condition and wit=
hin the shortest possible time frame.

Diplomat James Morgan will contact you directly to arrange a convenient del=
ivery date and time. Please ensure that you are available to receive the co=
nsignment or designate a trusted representative who can accept it on your b=
ehalf. You may be required to provide valid identification upon delivery, a=
s per standard protocol.

Should you have any questions or concerns, please do not hesitate to reach =
out to me directly at dipmorgan7@gmail.com. Your satisfaction is our top pr=
iority, and we are committed to resolving any issues you may have promptly =
and effectively.

Thank you for choosing our services for the delivery of your consignment. W=
e appreciate your trust in our company and assure you that we will continue=
 to strive for excellence throughout this process.

Wishing you a seamless delivery experience and a pleasant day ahead.

Warm regards,

Dip James Morgan
