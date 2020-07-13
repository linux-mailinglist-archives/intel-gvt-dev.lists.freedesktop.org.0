Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFDA21DF10
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Jul 2020 19:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930646E179;
	Mon, 13 Jul 2020 17:47:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic307-2.consmr.mail.bf2.yahoo.com
 (sonic307-2.consmr.mail.bf2.yahoo.com [74.6.134.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3476E179
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Jul 2020 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1594662441; bh=7TW4sBrN+RZdwdBb7fMFNHu5rNM0HMDWiBpVg9yZk+A=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=m2Y0+5eBt3HejX2k8wLzEImETGUWIDkJyER7jciEzRWxCi5mjYz+oWb6W1cjUvxpMPKHLC5HEDaC/iIG4vYGRdSjc7BkbzDHBchA8/4Zfa9BhssIKCaTpe/CFFsLkPHLSLPtvdspWJw/ObjHBSKMPhoI+/5kKgwCgtZIe0D1guTTnXiRN0NoI1MTcJPEELjk4XKNKCnnEbkwAIUmWiB83dfhudajoV+f2my5sDvcC62Frqzu8KzYCbbQJ29OLNrxVvxEvvhHPXJoJrMwJsQQrY1rQwKjVND/q0xgbkLp5Z6GGDIQA+CpnaEZ/d97bikqdcWUKtJWq55uEsbofEFDlw==
X-YMail-OSG: OFuKKeEVM1lu84l7t4_3meOysTmNTGFYlnd0bX1lfrp7sxaBB7XEpiaudzsDiWK
 p_x.kfa6iIRAHWwu62dpc_oTaSvbPKyU97aCpsxK6IY9nWaOuvBItT_fo4mea0Bi47_P0c2hwV6u
 A0uhRpyvNIjXhOygPC7gcS99tpLQj3U9bqNdbhdJMCK6W4Mux4edf4cUV0BzlGcXlmIJO4bhdgT4
 SaY1eOkI78tFbNtkqDgt_Ny7T2HEhQm9KJqaP_tvD.fQBH0VccxKukYFRQPkK6CetnLvJdKEQBi3
 j.2j1ibE2Q.27YRsBYEcxii.oRIF_nekZWt1c.wWEN2SXrnKW72wa.FD4Y7kvMwhevLO6dUOEf_4
 9KUTPK9qq8TzJZnNThZid8zp7fkQBJKf4qN_F.YPqrru1d53jfb7RBru8rxjIe28lFaBMU9KE.xg
 C0wv0Jf9sHlDbDwZ99C.2.WVSAfjnN1K2h0SWp6SHEejn0OWh151Io2Cy09FbpS_b_aHhGaTqi8X
 gvEYB42eNqGaeoOB95kE3.27xgkqAkfS0Ayuvh9mUMY3F4Llrr1eq4lHT8T2TxD6Dtvu_2v08LWY
 caTWhk_TLjZI7ZAPqZ2I_0pUxnZhqKS8OsKctzPunNUmaSPNDwH7TayZeJEWP8Q8dTkyYMYWe_Wu
 58RZ108P4lydgTGtMKyCuRPmI6ZheajXXGfhgQllqFyuxfdVL318t8E651MTKw4GLbUorZtwbZrw
 H0UnIIOnOfYKk81n5udHcGoPwRyPvakk8IJY1WSFDjUrEqs01ThXQ0gMd1N5Uxk_R_AeRfJGo3x6
 7VvwBdNW47.GeEItXQdLiuW5h09UuZuhwwjghjOFqtamHN5pNfvcqES5Su0kJao20._UPZDALBUi
 zOoYTJLLbEkqAJU_s6o7wf8IUMzNWUmba.JHE0yyQ3iuoMIYeURqTJhPMdl4JONYRvEJL64hNgfz
 Q4Ji5PJY_5MqJBYVRgJ3RDpoyiuNHOrYXmf_m8IOvsyD1nuqDnZhp9L69NHlXE9d6BmvQn4iC5CO
 zDJcxi06HaC2H3hpmuWQ7UC46Th1574m80qJgDn3Z.4EfibTi4ZtELK.YY4_M_IwRJuaH3NPtZQ6
 1a2rOxsOW3xZslSimzMckNOKhTu6WODurf7DuMHFfen0w5biRq3m7g6BdFPlBgGfOlgTAGjApG9m
 P_Jb9KxQN6LUjyhKpulKsbc0rPC3kourjZmCkC.kIItImab4OGdPL2jWKZP5Mh3k13uG4jr7iU9k
 Srj8nCQYJW4JNC0Zbw1tpmXqyrPzASiAvhBn8nEGdXFb1Tcz7ddn5lKJsoYmMqIHFjur55WY-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Mon, 13 Jul 2020 17:47:21 +0000
Date: Mon, 13 Jul 2020 17:47:17 +0000 (UTC)
From: Dr Tracy William <pickme4365@yahoo.com>
Message-ID: <2070310379.672630.1594662437061@mail.yahoo.com>
Subject: Hello dear
MIME-Version: 1.0
References: <2070310379.672630.1594662437061.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.3; Win64;
 x64; rv:78.0) Gecko/20100101 Firefox/78.0
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
Reply-To: tracymedicinemed1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



how are you doing, Its my pleasure to contact you for a long term
relationship. I was just surfing through the Internet when i found
your email address. I want to make a new and special friend. Lets keep
in touch and get to know more about each other and see what happens in
future.

My name is Tracy William, I am from the United States of America,but
presently live and work in England.
Pls reply to my personal email (tracymedicinemed1@gmail.com) I will
send my details and pictures as soon as i hear from you.
bye
Tracy

Dr Tracy William
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
