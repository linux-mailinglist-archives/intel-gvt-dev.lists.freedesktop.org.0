Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E477F2CA0
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Nov 2023 13:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E488B10E268;
	Tue, 21 Nov 2023 12:12:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 417 seconds by postgrey-1.36 at gabe;
 Tue, 21 Nov 2023 12:12:27 UTC
Received: from s28-mx.ogicom.net (s28-mx.ogicom.net [93.157.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D99010E268
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Nov 2023 12:12:27 +0000 (UTC)
Received: by s28-mx.ogicom.net (Postfix)
 id 855B66485D9; Tue, 21 Nov 2023 13:05:28 +0100 (CET)
Date: Tue, 21 Nov 2023 13:05:28 +0100 (CET)
From: MAILER-DAEMON@s28-local.ogicom.net (Mail Delivery System)
Subject: Undelivered Mail Returned to Sender
To: intel-gvt-dev@lists.freedesktop.org
Auto-Submitted: auto-replied
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
 boundary="7FD466498B6.1700568328/s28-mx.ogicom.net"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121120528.855B66485D9@s28-mx.ogicom.net>
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

This is a MIME-encapsulated message.

--7FD466498B6.1700568328/s28-mx.ogicom.net
Content-Description: Notification
Content-Type: text/plain; charset=us-ascii

This is the mail system at host s28-mx.ogicom.net.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<onlinemeailsforum.forum@s28-local.ogicom.net> (expanded from
    <online.emails@wydawnictwo-forum.pl>): host 192.168.100.47[192.168.100.47]
    said: 552 5.2.2 <onlinemeailsforum.forum@s28-local.ogicom.net> Quota
    exceeded / Skrzynka odbiorcy jest przepelniona. (in reply to end of DATA
    command)

--7FD466498B6.1700568328/s28-mx.ogicom.net
Content-Description: Delivery report
Content-Type: message/delivery-status

Reporting-MTA: dns; s28-mx.ogicom.net
X-Postfix-Queue-ID: 7FD466498B6
X-Postfix-Sender: rfc822; intel-gvt-dev@lists.freedesktop.org
Arrival-Date: Tue, 21 Nov 2023 13:05:28 +0100 (CET)

Final-Recipient: rfc822; onlinemeailsforum.forum@s28-local.ogicom.net
Original-Recipient: rfc822;online.emails@wydawnictwo-forum.pl
Action: failed
Status: 5.2.2
Remote-MTA: dns; 192.168.100.47
Diagnostic-Code: smtp; 552 5.2.2 <onlinemeailsforum.forum@s28-local.ogicom.net>
    Quota exceeded / Skrzynka odbiorcy jest przepelniona.

--7FD466498B6.1700568328/s28-mx.ogicom.net
Content-Description: Undelivered Message
Content-Type: message/rfc822

Return-Path: <intel-gvt-dev@lists.freedesktop.org>
Received: from localhost (localhost [127.0.0.1])
	by s28-mx.ogicom.net (Postfix) with ESMTP id 7FD466498B6
	for <online.emails@wydawnictwo-forum.pl>; Tue, 21 Nov 2023 13:05:28 +0100 (CET)
X-Quarantine-ID: <wA1lV5P2CRwI>
X-Virus-Scanned: Debian amavisd-new at s28-mx.ogicom.net
X-Spam-Flag: YES
X-Spam-Score: 31.878
X-Spam-Level: *******************************
X-Spam-Status: Yes, score=31.878 tagged_above=1 required=5
	tests=[AM.IP_BAD_213.17.202.166=25.7, BAYES_50=0.8,
	DATE_IN_PAST_03_06=1.592, FSL_HAS_TINYURL=1.799, SHORT_SHORTNER=1.999,
	SPF_HELO_NONE=0.001, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from s28-mx.ogicom.net ([93.157.100.48])
	by localhost (s28-mx.ogicom.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA1lV5P2CRwI for <online.emails@wydawnictwo-forum.pl>;
	Tue, 21 Nov 2023 13:05:24 +0100 (CET)
Received: from mail.e-firma.pl (mail.e-firma.pl [213.17.202.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by s28-mx.ogicom.net (Postfix) with ESMTPS id A7F046487A0
	for <online.emails@wydawnictwo-forum.pl>; Tue, 21 Nov 2023 13:05:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=www.nauczycielprzedszkola.pl)
	by mail.e-firma.pl with esmtp (Exim 4.84_2)
	(envelope-from <intel-gvt-dev@lists.freedesktop.org>)
	id 1r5K2e-0002Y2-Ur
	for online.emails@wydawnictwo-forum.pl; Tue, 21 Nov 2023 07:15:24 +0100
Message-ID: <1700547324.655c4afccd7c8@www.nauczycielprzedszkola.pl>
Date: Tue, 21 Nov 2023 07:15:24 +0100
Subject: ***SPAM*** Pytanie do redakcji
From: intel-gvt-dev@lists.freedesktop.org
To: redakcja@nauczycielprzedszkola.pl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.9 at s28-mx.ogicom.net
X-Virus-Status: Clean

Imi=C4=99 i nazwisko : TyncAcouncFirma/ instytucja : Telefon  : 819335934=
15=20
Adres e-mail : intel-gvt-dev@lists.freedesktop.org=20
T=
re=C5=9B=C4=87 : When I Don't Feel Loved=20
Beloved, you're the fire =
that warms my heart.=20
If you can spare a moment, would you kindly t=
ake a look at my page via this link: https://tinyurl.com/ytkauej7#k5jN9V=
   I've uploaded some fresh photos and updates from the latest events th=
ere. It would be fantastic to catch up and share our experiences.

--7FD466498B6.1700568328/s28-mx.ogicom.net--
