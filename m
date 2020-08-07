Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E483923EE82
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Aug 2020 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DB16E13F;
	Fri,  7 Aug 2020 14:02:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic311-23.consmr.mail.ne1.yahoo.com
 (sonic311-23.consmr.mail.ne1.yahoo.com [66.163.188.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7671B6E143
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Aug 2020 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1596808924; bh=rZvn9q2KUDOVmYtTZRy56i0LQ6JVwRNisHm68cstY8Y=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=JWWGzgL6vFPqxAzNroQ/1TdOsk/I0AMpBCuQEGseItafNWnOg+3++WwZ3QYyLVuUFllOp2k/O4s29KM6eNCIgU9a8B5sGjD2Xan7uUciN7Ezra/DBz6GLPSWX8n0PmWkdG8c+PE0ec7hBOib9jUgmlU7XZicF0iBmA9fghEViFH0T191sQyPRc1ENMCZA7sI+P2mf44k/bf+mUHUCxjp7TZ8cI/uITwJHkMC3Q2L8GLIf1RQ0qm7+Iy8Tmg7B8Wvb8NbYOFjnlef0ptMBwFBoZeMe/NzwW20pFsoxyeFuH4w7I6M9OunBv0yhD5QWReaWAIy3Jsuf8APPCK2qT+H/A==
X-YMail-OSG: hr0oJj0VM1mpUCd7PkqBIcocTd7TCZ44I8G5t5RvrcDgmoeFVoEufnfLdr1kBYb
 jEh081tf3ah44FJCLBALHJ9rr2eJarMSSDbxQkwoitcOumB7xBTPacflPGGzKG8DDHKq9ZMtWiWs
 0Wc7aYkSq3mD59_7GO85.lRAxTnfov63liq1yjTx7JbNaMhCu6xQXGxfjG9C3g.UfLQxPFSDqc8Y
 reMVScabHsQBhVuC30kCecBcVh0Z8T6ahj9qHJAW.hcNupsRMgjlakWgEF6ACtsGgRHAdkYPGqHq
 UJU3hMpkRzmALSDpZUkLRoVnGGT21V5MMlG_VxnuKFDpz1n3iLcXykpgzMTlknYGJO6IEWOhVJws
 fdxhbd5ew0if0RBS14Zf7PLYTP07ownLUbFyVyYBuxKtPwM88cICtHFy1QgzzxibFnTY1v_3kb0x
 t8MEpGTZ5XNOA1MLob3YxAowBijuMGFp7oBpDPwjVdapa5Sg_kVKS1jaqav3B7q0ESStqKEeTnas
 6Tlp3qBQ0XpVO.4YQi4V8iLfrIhx7ac8GW6UR.llsrk0h1zwzObmWeb58klV41fPUhF9Y7WuLYDB
 O4lkYqD6nqfyfaQqFwAwjz1zkBIS0xmHkpqnYPr8vP.gDHcutGgG0XYQNH6IvqFsQPWWvm4i2E8d
 xayfMidHEk7rQ_FvtGBYOqctp36IP2SDN6uvRYOwu9iFiZBrUhJ20SsjcdizbIoJ6.k_4lcpTqMy
 w5ZFwRSpkCkoYe8YT1OxEPXx6QN3YAT.r1q0lFUzLVwT5dHa05vMgKSIVFxzcsP39Q_sB5ha0FIo
 TuF.ADH9JkwOJrM5eUkrjrLlR3V4PIRnlWRNktIJMwMjR0QGt97PJYWuVn3d.nPWKuv0mPqTTA3y
 18.b8482mXw4bSIO2JCwZOTONhlMpVqFOGhKkimQcHsnyrUBUhn9_BLnsDv1JdyaFv5n9nwvLQa2
 c01NxHkwfGTHZ9li8KqNPxutClLfygKQ.zhwpvccWiBAkchbNBb2_duq0XMoRfhxsqaZed7w0dw1
 H19OVy8jVk3xadMHA5SJQHKY8uLRi75HZv4HSczSGp5l1S4.v.yLRORgeCcj4ZHI5zhf7qoxOjt3
 dj1XAuLlBLMFd3t5UsMiuqZ50i8rp4BMNKJZj9dBYnNEXJtqbYL3vfdvBiVgMBHQtoJ4EMtNcO.2
 plZ6MjnwKTVpIPZhUaC6ELIl25j7rP2T735QIb.n.uo03zgn1D2DiP3Jf1AWh1.Wt7C5MOj2UEA3
 7TJPkbtMQPhkLZiAu9e4ygxBOQl_VpFIXcMVViRAy4Lfsc.A2odsRulpyShFLAjD5AKw9tlNw5Hw
 _58RjFCRTo3Zig74BwHIylcQA.VWp3qnGtjRZizm7fCN8oERv
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 7 Aug 2020 14:02:04 +0000
Date: Fri, 7 Aug 2020 14:02:03 +0000 (UTC)
From: Mrs Wright Anderson <cy5882@yahoo.com>
Message-ID: <1051265606.1396745.1596808923248@mail.yahoo.com>
Subject: Below information is what I need from you so we can be reaching
 each other,
MIME-Version: 1.0
References: <1051265606.1396745.1596808923248.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16436 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105
 Safari/537.36
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
Reply-To: misswrightanderson2@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Friend,

Greetings,

How are you doing today?

I am Mrs Wright Anderson I work with the department of Audit
and accounting manager here in the Bank of Africa, There is this fund
that was keep in my custody years ago and I need your assistance for
the transferring of this fund to your bank account for both of us
benefit for life time investment and the amount is (US $18,500.
Million Dollars).


I have every inquiry details to make the bank believe you and release
the fund to your bank account in within 7 banking working days with
your full co-operation with me after success Note 45% for you while
55% for me after success of the transfer of the funds to your bank
account.

Below information is what I need from you so we can be reaching each other,

1) Full name ...
2) Private telephone number....,
Receiver Country..,
Occupation..,

Thanks.
Mrs Wright Anderson
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
