Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D434808E3E
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Dec 2023 18:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CA310E12E;
	Thu,  7 Dec 2023 17:10:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1895 seconds by postgrey-1.36 at gabe;
 Thu, 07 Dec 2023 17:10:31 UTC
Received: from se-filter03.tld-mx.com (se-filter03.tld-mx.com
 [IPv6:2c0f:f850:1:218::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA4E10E12E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Dec 2023 17:10:31 +0000 (UTC)
Received: from cp22.domains.co.za ([169.239.218.32])
 by se-filter03.tld-mx.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <emergeso@cp22.domains.co.za>)
 id 1rBHOZ-007S0l-ET
 for intel-gvt-dev@lists.freedesktop.org; Thu, 07 Dec 2023 18:38:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cp22.domains.co.za; s=default; h=Date:Message-Id:From:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rkBf8JIzG/AsXZKMDVrVbwPC9YwSVbTUApm9CSKg7r0=; b=Lqh7mguxE+IGaZreiJKSjeznNt
 KvnSsQc4uGz1+JQbG3+Xldvk/NDpkxAj3taMsoSJ9ngSDc9J4tYwDkO5bvBqIA7VcjV9l9pED8J0q
 TFaFn7BBD6YTtRxJfAgtU70Ds249QHRdZcr/8gHN/M/CSHuTeh1lGEGO9UQwFRz0bUlC4IOLN7PSc
 1o5uWpBkUbB+CoTY1Txip+e6sLRlRj145Jw8sOSxY6LegOJdz95ZR6YbOvmUm0KnlADnx2zBK4OAW
 FGlFvubQq+fkKPrNE1E4XFu11IE+R8bVjrFhrKZz4A5WT5pYx3vLFNw/SKjR33+X4YlNNrrBGy4+H
 P6r85O0w==;
Received: from emergeso by cp22.domains.co.za with local (Exim 4.96.2)
 (envelope-from <emergeso@cp22.domains.co.za>) id 1rBHOY-0005Xa-1C
 for intel-gvt-dev@lists.freedesktop.org;
 Thu, 07 Dec 2023 18:38:38 +0200
To: intel-gvt-dev@lists.freedesktop.org
Subject: Copy of your form submission
X-PHP-Script: emergesolutions.co.za/contact_process.php for 138.199.7.130
X-PHP-Originating-Script: 1753:contact_process.php
From: shegun@emergesolutions.co.za
Message-Id: <E1rBHOY-0005Xa-1C@cp22.domains.co.za>
Date: Thu, 07 Dec 2023 18:38:38 +0200
X-AuthUser: emergeso
X-Originating-IP: 169.239.218.32
X-SpamExperts-Domain: cp22.domains.co.za
X-SpamExperts-Username: 169.239.218.32
Authentication-Results: tld-mx.com;
 auth=pass smtp.auth=169.239.218.32@cp22.domains.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.65)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/ZbiVFTHSoC3VL07v0s1LdPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zuw9h+h1zAannW6FFT1C8uV7/OA1M1ilNEwd/bINE37qFE
 3UJM4cFl+Iid+N6xLmGPsV5prpxfNKTaELz81ryJWmuNA8WTybi1JN85FSnfKXag7nPZUtzcfvYi
 hWfaqKAzJGKZFQDicgnfKvApqtvvjzgrf8QKU/vQFfxLBRJ2ThaSwa5YYGoXqCnjM0ZKteUI6J/M
 tx+QoirjHW/a/jtXDUSQqjvRt/F/vgmlOHfT5nPuJfOIAQpYEteY7zmkHA+rMIibkpY46HKySyiI
 2P6osIZXKmwzbGT4VvpTL0Eb54bT3EszvIbAbB2Zy01d/7IXjkdTeVZ2qGWx/wHRpX68nXp7ZiEZ
 MRNwIR4IbTbWa3UbJJ2cqu0NKc36+gIWQ5zjCNGSU/UdFKYhkRGnQY2TvvE/X9f4ikS6v/cnqp1T
 bBmSvC6qJad8oDRDO7zv2HxUmIXDvU1PvO1t/QJPXwvmqOB4PynbZjUxDYa/iqJucA2QEetkvH00
 /xmn6oF5z8skuB4fLNdsm49znGEOwW1RyaT+fhnmPmZ+OUuV5BM6eyy5Vo6xOiF9lxkCbdmQZuSA
 DCJKbJV6+0eFVnejuudhpEGXqaejzlsz1A0gN73gYeV2KqQFuD3VSWAitKq5pnFaNNEpjoYYJ2Z0
 BKQQqJqsMyb8JuNAaEZk+iSjjJO2I/0jveDf9khBB+5Yp6+dn8PrqdBtHZLdSKbaqxt8eJe47j2Z
 i71fksgjDca8WggwfaQElPJyNJdgFsJFEs/93MUQ8t1vALIBX289UIJG4u0r5AnI+wExEi2ZXZcw
 Fmj/G/Z0h9QRHd3LSu5dZb181RSH6FVFVxrMF422/Opw4+rZ6Bb00eACLoB4nYmyffPgfoBxPllC
 wMn3ftLm/l6sXe130mHVjQnGED/5ZMG443Mdo7fok5IF6YZ0VoJLTTx/sGw0ye9BIr+3UFXxnPkn
 t8gIcrni2VmWSrBU+2pv4GmbgHE+WULAyfd+0ub+Xqxd7XUORXqJwadJGwfLhGtN7hs=
X-Report-Abuse-To: spam@se-filter04.tld-mx.com
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

Here is a copy of your message Typereutt

The Void in Our Relationship 
My heart is a book, and every page is about you. 
If you get a chance, might you take a look at my page via this link: https://tinyurl.com/yr5jhg94#k5jN9V   I've uploaded some new photos and updates from recent events there. It would be wonderful to catch up and share our experiences.
