Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12E257F89
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Aug 2020 19:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB1F6E161;
	Mon, 31 Aug 2020 17:24:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic316-20.consmr.mail.ne1.yahoo.com
 (sonic316-20.consmr.mail.ne1.yahoo.com [66.163.187.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1AE6E161
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Aug 2020 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598894695; bh=/wWE/srJrz9OuGq81agug6j8cDZKLJjOEAHUvES6oeE=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=nLhDPTHaq6PYuzdcIY1IapZrubc3sx1PFHncNyow8E9Ef6vyTKwbJGMV9tLHVeoCbueZo8PMIUeRMYDc/im3G0NwrCo0PKABke/3Gt7LttHixobNgFhuIT6kTiJo0yl9GfNhbTU8OXqjQ4IhO/zYj3KC5lVL0EG/H3nq7K9tP1JxZLtLzDxBNr6jSdeVYUK1oa0Q9eza1jjW/PPdaa0QL+AOaUQDV2Ppb4vwFMZ3hrgxp5dhkBlfpyYMkcONjKBIqmLCztnqMgu5LtsM0pzxLCbdvqWc717zQGXWDUzdIPg5H4Ped3Pn3vNeiv/mBMN5H2egJzF2NueELq4J9lwhWw==
X-YMail-OSG: rOuQ7oIVM1mlfwlWca2qNGEOcPywNGZBT8YhzAi2nbGi7NpgaSUVqQwA02xF.Ki
 URLcUxdRu7uNJLfNqpY4uboSeBuxW_TrIoHbpJtULi2MLRKo0K.U6zVcjxjhgdeLuBulyHH8fQjl
 DpPz4B.MpSPghMamHjT4Ex36hhIXgeMNn0P543939P8jf3ePR0jkInV3MFVBZ2uOK2gqo5SgHyx9
 dNsIepLLcLZ8EtG93ER2aa21KFs5swNNcD6x6ORQO7_MkzIJQL54D88d7.6BHyJDD4yvPqqzIbA.
 .1aVmf7fJf9T44TDEeLZW3YseqoaLjKeFyfrFgxD_3WSCDqK6s_EW2V8m2pZHgEOYyFxqsL0QQOI
 V7gBbph0P16IA3E.z86qtzBwWJEXfGoPgi21zxcRfu5C01l6paPvT4ryyMQr16IV8d8976RNEq.M
 UBgQ2Izr8rCJw7vChUF2HJM8u5nJeZHxEA3f9nUB5xi4Ax.v2jm4PuobYq5.dWGza2otRay7jABf
 1xvfz8jBxsv4Ixdw8SgLqHvp_7GRsfqLI5Gq_gHUAUIUliAnktCaC0WrnTomHH50.kEAB5e1OurR
 55wrUdxO8FjHFauzLu.ogDRwXVsYG5MOqbleQHi2FIH9ivRCAGP7arxmeh8rwpGyyL5OZNL7z3If
 OO3K1vmW1w0AgRgn_q3tTacgmXJ.rZRGqROjQXw97bz1Jr4p6jmM31CPVzrAtg6WcCb8N70VInrn
 Q0dyHbUsZkTTP53PmEyoWOoguhN9sWpne_E92LwHd_JuXWuSXtG6xhK.pXyUMjdaZxEoX2aJG1C_
 c2zG3XadFhS_V1jepkZKzkJA3syyNe.KZzM5H8hy5hoa7hWCkINFohyu3Yg2PSHk4i7iBaJj3Vnw
 hPPmN1wHuRjxwR.GrpCHSFEzFMXXUEUN.sIq4DuFGRrsjX6TeWCNLDrYl1uoKe109A4j4i5LlY.Y
 I2vZAR3wLaqBHynMOVlYC4jD1u2ba4AKWX60qtLT56hx002HsQ1aszKZFJV1SDYOuB1YC_SuURyK
 ZCmEMa8lVP6NwZBfjZ30fg7BEUYmU0XM2uXNibi6iwKcjB2eEIav5yFDaWg3zkNrH8j17Cy4ZJAN
 t9bHiLc_axK7U2bpArcLrJptnzTCou0jlQ3gYofH9d82m0LSPOWQ6yuNNnGcfkVBYeCHO9RDTeV.
 UNbGcjaSY1RoZmpHqugI2Va2p6dUA3Ub0Q7Ql8TY6CL0H9s7xszRrozlo.kZ2eV6eJkQBC3yVyjX
 CVjzpHiHwxfxUKj1ydyRXHRKUW5cE3WdeR2W0IczqDMTJVP4UyCfarrg6Z56xhfo4_fhtcDcRh64
 x9AYpvaVGdIBndr8rcVaKbqNpdqteMRygLqwouVlW0YZceM5wTL0L4xvcNSbzuLGpyY.l_7vYjlt
 f8xterIhAbG76cnQr._xokWwL.4SHTcGJEoEtD_hBo5Q38r4zr6EyIwlh
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Aug 2020 17:24:55 +0000
Date: Mon, 31 Aug 2020 17:24:52 +0000 (UTC)
From: "Mrs. Johanna maaly bob" <ch_reni@yahoo.com>
Message-ID: <1110018791.953784.1598894692777@mail.yahoo.com>
Subject: Dear God's Chosen,
MIME-Version: 1.0
References: <1110018791.953784.1598894692777.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.1;
 rv:80.0) Gecko/20100101 Firefox/80.0
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
Reply-To: maalybobm@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


Good Day Dearest,

I am Mrs. johanna maaly bob from Australia. It is understandable that you may be a bit apprehensive because you do not know me; I found your email address from a Human resources data base and decided to contact you. I would love to employ you into my charity work; I am ready to donate some money to you to carry on the Charity work in your country. Please reply so that I will give you further details and tell you about myself via email: maalybobm@gmail.com

Thanks and God bless you,
Mrs. Johanna maaly bob,
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
