Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPfbBp3eqmlqXwEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 15:03:09 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA872223DF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 15:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D131C10ED2E;
	Fri,  6 Mar 2026 14:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qau6CML+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0F110ED4D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2026 14:03:05 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-79827d28feaso93668627b3.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 06 Mar 2026 06:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772805784; cv=none;
 d=google.com; s=arc-20240605;
 b=I8oZ+iFb/M/bA6hGYM7X1uSbiXF28wDpWKUf6N2ldrMnAaTx5Rs1lKG0L72xW6IJb5
 MTTn/wmVZNi/8H8HDlmiE+wvquNX8yxAww1kEkvwkN8FDukil5l0unBmRC742qPNNu2Z
 z2eN1zV5nIfbPCMlensK2xsNkA26hRD/oUuqdApsv0ou91GvGBODDcEBGIDw1iue0fG0
 EDPX5aY6v+nQPIOs98i814wJ2vyOcI8Ts5OR9IaywKOISny1qRMvfRmGhhz7QnNXSq/Y
 hFEikoBTaZOpSSciKWCWmRmOPiOVhwaHeOPucdSK/7VidSTygWzIs7JqzCpcEfL8/vks
 3nvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 fh=v7sm1xSxbNziUNu/48JaQGroFypnxsWTUsazqpp/GC8=;
 b=PqjNuGBVip2IoMkE5LxPHiw1hKdPaAH/IMF5qOuvX7Q3+bQED9rNBvoR2K5tDf9ggD
 Yjqyn/sIMbkequqU2Mjc5PrjCSgeNw1FgTUmS5XKVFRk1FUqRASChW5zxHtWwWcaTlhJ
 mbWB92iKflpeV180tIvUOewEY/f8MrVGcHXj/noCabhK5AttOzIGqm1hA8a4NaeSMnwJ
 8tSVUg4H31cvalLMUJLeqdf0G7oyILO0BpnKgI/wGMwsrUg/+kXKXF8EG3HLmCRfotsx
 HrNG7hR1M7+OIhAmhDtSyA5FwIM/foYXD2u8x77wU3hZm26sZwawmU+wYJvTmOh2BhRA
 ZrMg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772805784; x=1773410584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 b=Qau6CML+yiU/U6ticC0YdY0ouic7E2IKjUeEDRDWliaeooXqgKBXwRJrv3CNiI0rnk
 523FzqmDHYkI5SD3TK32EoRpOQYDdQQ/0fXnFTBMqVwNPaZsEIf0k8RPYxdELFEiWh+P
 yOd1VBsksRR1FmxGt+PjwmLAmOMoX3j6IUl1cpa1geHk1VlXuOWUavX0JpkaDoIvdQI+
 NOk0r+ch64Go68HTXDhS9d28kxGlaie2JnBsy+rtQEe9ozuMJQcLJ2IURGodeRl7B+oT
 yBKgYWfMeihQIU35h3n6v5Z54s3ZrNN1eLazHlonLBNncGXtK9JE70sg6eSgBwZtWKzX
 e0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772805784; x=1773410584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 b=aAe9evJnTUbQIK0hHALuNV1ejngu5xHuUtw9m7a7x6ArkaE6Fjo5s8U/7gWzaLHNom
 /d/A+UX1rsbM3PQTyI6F22QErHHg8GNtIB0rpuHiGVg2/bu6hEXwhrzjwrofJc4V4tYo
 B+f+oKOCiZ+u9iH2GYDp7jaArcAHoItboaS+b75z5cKd2W6q9sX7AwsDFwJODmJa8Q+f
 V7rC8WmDlOO0Eg76BspUDb2D7zVt2jk7/SfKHS8+HiHlBeMdltLdC6q/90/SL9UbVcYC
 wKUxI7RgeP7OtpnotCXohcJDHnL9d484QbT5CI+p20dYo9FeJZ2tYNb/lmPj88dhGElT
 O6XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJi6CYvQIA5KE/LS2JKNKtPQMkw9z524uXZ1TVDBqb8npsPQXmiGPYiIskPn3D68F3u/3SdSTi52s2vqRt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi07LMfRhv0rk6zF7XI7MEg7H0atDcSho+kjKOP6JMehWSI85I
 urT6JUlhJQgsscv5vBsUuCzElnno4/uaWjBDt6C5vkmVAWJotO5pCysUbrfQKghKaVc8Q8nA/8F
 9TkD6KIOHwdRXkwz0pWS5IBTGYPe0nbQ=
X-Gm-Gg: ATEYQzwrxI471pRklhioL+2a0O/2B8j5XarK9cC3zbRsdKV5/6GJ2deoezzEg9702DT
 o6lda9pes0pOgIY2RM6D4ot0oV68mLBfUblBwI4cgN9u4nnQQzstPryENNk5zZeDvotQo9+afSD
 P5f1mLZVPdeKUfESvgXjO3cr9CmmiFai4VliIJKgrzU/tKIU9oHqXpPyPfyif29cAIgXsgqE3bO
 xVTRedR9EQu/qHE+xwekGWggFRM8jGRFpn7my7GXnfom18BaL/1HKlntcMer/rDikKJK4LU+msE
 pCde
X-Received: by 2002:a05:690c:f03:b0:798:740f:6af1 with SMTP id
 00721157ae682-798dd6e9b55mr17942317b3.24.1772805784050; Fri, 06 Mar 2026
 06:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
 <20260306015022.1940986-4-jim.cromie@gmail.com>
 <51fed793-869b-4a5b-b90f-2ba80c13d773@kernel.org>
In-Reply-To: <51fed793-869b-4a5b-b90f-2ba80c13d773@kernel.org>
From: jim.cromie@gmail.com
Date: Fri, 6 Mar 2026 07:02:38 -0700
X-Gm-Features: AaiRm51wLCC9Sug6nG1UgnDvIstzQQFHwne8N2p7gQVCpTt4Mc1sv69X0Jjm7fU
Message-ID: <CAJfuBxxe5uJc0=nLC45JMp1dcQhyiyyyNuv06jZJX++YJaN58g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] drivers/tty/serial/serial_core: ratelimit
 uart_wait_until_sent
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Joseph Tilahun <jtilahun@astranis.com>, linux-serial@vger.kernel.org
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
X-Rspamd-Queue-Id: 4FA872223DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:gregkh@linuxfoundation.org,m:pmladek@suse.com,m:ilpo.jarvinen@linux.intel.com,m:linux@treblig.org,m:jtilahun@astranis.com,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 11:32=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 06. 03. 26, 2:50, Jim Cromie wrote:
> > Ratelimiting these pr_debug()s can reduce the console flood during
> > bulk dynamic-debug activation, in environments where a serial console
> > is used.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   drivers/tty/serial/serial_core.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/seri=
al_core.c
> > index 487756947a96..6db465619c70 100644
> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -1790,8 +1790,8 @@ static void uart_wait_until_sent(struct tty_struc=
t *tty, int timeout)
> >
> >       expire =3D jiffies + timeout;
> >
> > -     pr_debug("uart_wait_until_sent(%u), jiffies=3D%lu, expire=3D%lu..=
.\n",
> > -             port->line, jiffies, expire);
> > +     pr_debug_ratelimited("waiting on (%u) jiffies=3D%lu, expire=3D%lu=
...\n",
> > +                          port->line, jiffies, expire);
>
> The changed message does not make any sense.
>

Ackn.  Given the narrow rate-limiting purpose,
I should have ignored the checkpatch warning
and kept the message as is.

In any case, my test setup didnt actually use serio,
and didnt get flooded by it, so I dont know that this
single change would be enough to fix it.

I withdraw this particular patch.

>
> --
> js
> suse labs
