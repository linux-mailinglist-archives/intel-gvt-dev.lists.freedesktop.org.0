Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8CAE1DA4
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Jun 2025 16:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785F310EB70;
	Fri, 20 Jun 2025 14:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H03gqolO";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049AA10E057
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Jun 2025 14:41:50 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-40a4de175a3so1310083b6e.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Jun 2025 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750430504; x=1751035304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
 b=H03gqolO/xCfVU4mwWYlbRKtc96lgV+cp/5Dr8OevlgX1RZGGQ7DX62pQEzXxmkkNV
 8zQZNUpjPfLswkpWYnSXBHyxm4zLZZvEqAtP3lhGxOWy4lLsFbTV3erl0seFnxRRuc1X
 Z+GWP7us5DJFapav+4D64rb4Nlbt7q9hfJ//A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430504; x=1751035304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
 b=TSlOGL0swikZzO+BdhfQEIcwq2XgYqiOVOPI8d0SKJ2gVqhqC0E5kM2JjETSTv3GAx
 eyecthGxt5InhLhmhyhYvZmjSgRYpBTBWCGmWNldRfa0R+hhbMBHCFbNOK5rVIzTkdN9
 79zeqIkwrPxKhGAmZvXpuzQpnssCgF16JsyVSG/GKE250G/2/b3AVvpFMAxwnwVCtF2u
 bvavNmStTPcbpiKUhss8iViSj3mq7jacMjFcc6aHYrdpHoqqDIkcydd/U/kye7G49hYK
 P0NN+hx8pQtngJ6LJW14Cqt9ftBXFKyhRHRQh6pwp2FJphnt+HW9DCP/MKRrPG4TRkc5
 CvNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzau52cOj+DgnkgB8zQUZIgidGLBG2XamhMOVGe9BB0p8FlLvri8CtPCdwuoArEvYUHA1RvsHpVBpg6lpR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEwjYG38TcQnOQ2GkSnvk+5/dM5YNQEw2rmUNUkUDrtxvGOgZF
 0rm0US0vb1mV3eZEHLDs10kEXd8XjGeJcDU2cs5m2dwyb8fnZ4A1qmwomKxMWfSNeFL57/4o1nz
 enO/gu1kC
X-Gm-Gg: ASbGncv8NrsNajuT9q2+O7rhKHw0JGJF15S2kXWUnNKI64XqJec93RAa5IWLOBMzkFd
 fUI9MCjR2e9ShQY1o+nJVcl6vgqpL2XbGmP4eMdV+n9fLHork2P6qgXXVVQecCG+Hnxx1WUUtAs
 zglrDCNm0WIK7LvWNTY76fPGYRli2ZstSV2Yw63xpA7xTDPSqb3TNxV9K33JDc90k5NxsB1pPPs
 xW2StwtRMRzGvvtMu+5/kFtjPO9s+3XNSAn8Q1NgFaDojpPKBQCnDSUYVTZXRaFebPtKyqbB0vX
 C3WIoIiq2IlfkcuuVes5iUH5jXbBRQO4xyVlCg8D9MGwLXtdrIAZIrxORHcdpvyilYgBWq2CASW
 IyEOOFtMrScjHgY4riGMtzbaneg==
X-Google-Smtp-Source: AGHT+IGgwv+jcxvcX/oxcQ1Cwbqhnx+WFL/tKtSOmaEj2gmP5aMqmpp7j8zCPcBXaGYqMNIrZ5jlSA==
X-Received: by 2002:a05:6808:1396:b0:408:e711:a9d with SMTP id
 5614622812f47-40ac70a48c4mr2360351b6e.18.1750430503619; 
 Fri, 20 Jun 2025 07:41:43 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40ac6c30ab2sm316682b6e.12.2025.06.20.07.41.41
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 07:41:43 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-73a9c5ccfcdso105057a34.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Jun 2025 07:41:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUS/S44wXUl+FX7jbXidZjK8zn4dWzMBfKixDC2P+z767fk4RpawAkbfp7kBYXEHWgMnou5zndUok5yD6nt@lists.freedesktop.org
X-Received: by 2002:a05:6871:4195:b0:2e9:9e9:d94b with SMTP id
 586e51a60fabf-2ef0094c0cbmr2001638fac.39.1750430501165; Fri, 20 Jun 2025
 07:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-29-jim.cromie@gmail.com>
In-Reply-To: <20250402174156.1246171-29-jim.cromie@gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 20 Jun 2025 10:41:03 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
X-Gm-Features: Ac12FXysVBlI9m3EGLlNcwPGQBWhWDrHdfE7f5KsOCiBBCH_bJGVrs_uGmTAM7k
Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/54] dyndbg: restore classmap protection when theres
 a controlling_param
To: Jim Cromie <jim.cromie@gmail.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Thu, Apr 3, 2025 at 9:48=E2=80=AFAM Jim Cromie <jim.cromie@gmail.com> wr=
ote:
>

\snip

>
> -static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> -                                     const struct _ddebug_class_map *map=
,
> -                                     const char *mod_name)
> +static struct _ddebug_class_param *
> +ddebug_get_classmap_kparam(const struct kernel_param *kp,
> +                          const struct _ddebug_class_map *map)
>  {
>         struct _ddebug_class_param *dcp;
>
>         if (kp->ops !=3D &param_ops_dyndbg_classes)
> -               return;
> +               return false;

Return type is struct _ddebug_class_param *, should this be NULL?

>
>         dcp =3D (struct _ddebug_class_param *)kp->arg;
>
> -       if (map =3D=3D dcp->map) {
> +       return (map =3D=3D dcp->map)
> +               ? dcp : (struct _ddebug_class_param *)NULL;
> +}
> +
> +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> +                                     struct _ddebug_class_map *map,
> +                                     const char *mod_name)
> +{
> +       struct _ddebug_class_param *dcp =3D ddebug_get_classmap_kparam(kp=
, map);
> +
> +       if (dcp) {
> +               map->controlling_param =3D dcp;
>                 v2pr_info(" kp:%s.%s =3D0x%lx", mod_name, kp->name, *dcp-=
>bits);
>                 vpr_cm_info(map, " %s mapped to: ", mod_name);
>                 ddebug_sync_classbits(kp, mod_name);
>         }
>  }
>
> -static void ddebug_apply_params(const struct _ddebug_class_map *cm, cons=
t char *mod_name)
> +static void ddebug_apply_params(struct _ddebug_class_map *cm, const char=
 *mod_name)
>  {
>         const struct kernel_param *kp;
>  #if IS_ENABLED(CONFIG_MODULES)
> @@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddeb=
ug_class_map *cm, const char *
>         }
>  }
>
> +/*
> + * called from add_module, ie early. it can find controlling kparams,
> + * which can/does? enable protection of this classmap from class-less
> + * queries, on the grounds that the user created the kparam, means to
> + * use it, and expects it to reflect reality.  We should oblige him,
> + * and protect those classmaps from classless "-p" changes.
> + */
>  static void ddebug_apply_class_maps(const struct _ddebug_info *di)
>  {
>         struct _ddebug_class_map *cm;
> --
> 2.49.0
>
