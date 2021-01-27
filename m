Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD530643D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Jan 2021 20:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87AC89BD5;
	Wed, 27 Jan 2021 19:39:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic305-20.consmr.mail.ir2.yahoo.com
 (sonic305-20.consmr.mail.ir2.yahoo.com [77.238.177.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7697A89BD5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Jan 2021 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1611776391; bh=tQZJ3cesv316ejQe7ZgT6rP1jV4uxIWjRszBppy0SBM=;
 h=Date:From:Reply-To:Subject:References:From:Subject:Reply-To;
 b=WUEONdBqK7dHWCZ5Uy4RB+1wL8yueQT881S6SPCWsvWnCowwDrU35kejMCGs8P230hjYyKOQODpVJD5YX8pgY4mCnwBX04i/Vmpcj1/OcJ3a1lx9RpKxxH/8U8ZI8huEH/MGS74y0XNS4MrcE8EI+mBm+V6p3i3C/L8vt6Del4Y1lijbQpqF2j1dycRZfmWobRaFkP0wKlEeZGphO16ZFJGdLbW5OIbpIPlTxh397jcHTSaeiONFYuFp3KCtuWj2kEAkXf+meTFFu7Hw0dV37ngIKd1BlhZEXRmzw5ZwTA1lpnATM8hgQM9scMceI2gR+uDMl78CWgJLta6bxTZnxw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1611776391; bh=5MUqvLxe3fVUXMuVgplfQ23D+BDvIY1rddN8IOHUx59=;
 h=Date:From:Subject:From:Subject:Reply-To;
 b=W1rcdHSA1NOHodp8cVB5H8o9HnSbs8+WvOjs2ZHk6CMFA8NyCMCBB65qrV81K3YETSFb2bz5r+PfXdX3T25yCqajm9yPS0WSLF/PRfFeoHbTVuKG5Orjlivj25WkbcGce64TVOT3ei/93sVjpwbY3si1CA7Wrz//6fsybxy5QFs3hWDcdczMhjxoWsVTgJlNyv/UJUAEXyV2nonjewLRX9tMU1yki8bEG5OPctv7Z0r/Hakim5qQftgYQHC2w7fwU0a0e2pmA9woQyg5X3NEe0R1CNetj2j3mKai8HrDHzFnOHkXsC1THfIvubwZGYWF6lFiltj9d396vwCUdWKM4g==
X-YMail-OSG: 9lyJhE4VM1nbJzHi846IWZ7yYbXCCyrQYWbC1vLqdYh7BHTlnHt8zlgn19XFi_Z
 KcyC2RDvhS.66PmmPG_l6H6j73j3WalvC7FXKnCYbvI79H0KQD1r4a9LzFPYoOR3ZGOqEYbm9sDE
 NWShb4uVeBM4FVeFCg1Tu_nICwmHN3fPLebm2DMWKD6ieuPsPy45WgqTnq7xTzKDtS_8uS0s6K18
 rE8fAaTqU7yMZqY2F0eYeTv3FupJbElM.OT45sae5f0jOLOrS6NRy3dVDCj_19tRGt1cV83OkXYT
 K8xDAxHpo5FaPeG1QpJC1BhBYcwpcuIq9CsuwRDmJshHwNJ7uABgqJWooh3a.mPadR6uok_gye8S
 N3ODcVZH85XDhdmndwK2NZ.5Q3dL4pMeb.daxwCUkaY3AfFs.GgHCJXLk9WH6aj6iKMBJeVWfDEr
 r.8CQcm.Mgh8YPh8CVLNbUae8HvXXSHuPMU3wCSfwDfJ9tpxe845donf.rR_EuIOPXtLf8ll61Fg
 IaLJysywCphW8co8C1EHyJ1tYArYrs2O9PNY7a10nuYV1Qwcmhp.4D7UPC59cKLnFp8urWKQvYoB
 aETxwQ4nWsI5U3QpCCyg0X0yNfhCWc92du8EKAdzN4c0HNHfrpiC10xieBt5Tl40lQuTIdsDY8qC
 qirJ0BEOcLpXXSR4oACHMocgsoKpJUGqkIQ_uwRaaUOVwOkw4dzem5k0tdJB9LZ6Y..jb7nFax0C
 hIW_qVEe9Yh_l.zS_prpyxkZCdlY40VMYhQ50P7RCSl9I.eJfE332wWCh1AKtpxXOs_Fqf4f_xrA
 D1_F.Iu.LrbMqUQ8cIed2DVX.9l08LQYmvAmmi0pgxHhIQFKmYGFFByF46NfeBJF23YHrB6CJmRP
 eZ_EGHqWt3BCdRnAlUhYJtLoW7bRVs7MXeeYOK0qubdWZNJBhU3RcFM3949WA9Xd5ICBOqHt4wRE
 5szJvEd33ymYplnuoLDOlqaptiX.AehoE7tSSFhoZ5e0LaVDfayU57.Qa4HLbfwtqx2GaDd71Q68
 d4MuzzyiB4WFy93O6SZcdIegBbBXQN0_3koySqRjWnDZnE5yTBU060fanPP41NxliAaMlQ3aGOMQ
 koz_6NcopK3ClAluDBjQjmShAQL6NEf0udPzP2rBZDzb7yg42id8KzptNUwmn4rBLVF4E5aau9WW
 0MAlSjYs6ss5YLKjPbPO3mE2_wurqydQdsn29867WpDyopwVwW0ZH6U7SHBXZbVohuWRwIMhOOD.
 j3NjN1HJs0KmY97wXvUx5M0JVOA67gzpLXYhTw2aP7AAMS7p.z96T819uSgBKWAX1CtLq4zTHcAP
 g7MCgeeQqWqokdybUL4cru7lbpOfrOMkYN7rkGQeGo5j6UOJj8jXfJgWvpsYe9JmRvnIRktWc43q
 zJBrSnd_9nbRBHRtF_SPTcDEZ1N7tmslfPOn6YIivc8OThOCa6WOdxW1MxflZlYd7JxEUaEsN.eU
 5eRPporwAY9Xb79PxAKAHlBo7vGHsOqzmZLj5qF46uvX3_goQxg841wD0lxZk_xfa2VMGHUERrkW
 SP10yeYtck3ImxLW19X9lnhAfV2V_y_X5OCwvfMEgOdTt7jWKHQWNbeYjwDUEg8jFmpUXcv9vIGW
 rrXkBofcfMxlJA5N5km.PBZQMTnSCwgGpMOkds3oth_K8oHAj4oSDoQZtF05GYS84k4DjsiivCpi
 K0FHH8GQ0uGVoQ_LNOZO1ALjo_cBVExjslscasRvdS0o1becmgwc4IDdU9WUyVad7whQgK3D6Y4J
 ZmwtAN_w6PeJq9oG_qqwEL4DeLb5klI.ab4HNJuIzK4shpDpsp2kGUvDp5VecIj3UacCAXOeMwxf
 QjEToWXv6rNhEO3Aqdd1LnkI6w0s6vTgIMFPtW_pgx7a6dY6o_ZkkdbP1E4ioGPfb_on_nLxlB9q
 eK1HMXCf40cgLrpZ6tZyMfQf6K24tWaQhvZVcE6n88j1B_D9mwp.bg2GDaZLQzfgPHxQ5cGuL32L
 0MECxVFceDJkf6oJkZvaZAci2i_bqg5LdP96OFBw9tnXukHAXxHX8ftQD01vQnISWz448_8KkRmT
 g61EzlNJgp2iu20WxBKiNvIz6.Gvhbnoud6c6PuKBnR.KKsCgHR.vBKK300VGd0kE_J2.V5VJTmK
 dmwtTX864Tg7JmbGNHmLeKlG4jpSUIgi8MyledarmsdVLD2YlH4A73bnka38kJWTp_DxhgBbedrK
 6ZzWIORucqUyfs91Pvxt1oxdS7Ufx1K.TueIkSbFuHg2Mm8sbUnO8tDShA7nIlnRPOVdv9oVWyUl
 fFS8Op0rnkW5RIAYdQvZb7Vr3ajw4W.ymRKPQf6DuY5P0tDmZn2WcJG387a.rySp8NIv.sSXqTqk
 1KR_xr0yX5hjnNzJjbw5yUsYJQe0F5hccT1rSLCtRBJZUFrEKAjuUWhj7PYn9UkfuDWDX_1j7O9C
 d11KvDkStZLnKfRzS_nFWAoaVt6AMaxqBIr6FX2wvNm70mxNQ8zSefPqwZhBvfNJcr5OZ896U6.Y
 OgbxmuLG_hsRwG.9fYXmGC79HHWt7oFxpn_IhFoGeRvXWZEJX9Yp_2gZZEJIx5clD.hkvxFk8GWf
 Q2FHxg0cUv0yGFiL_C6kSXC_zEHcj.iC6oBz6fHYF7CKx.ikElOULIYS3CZUtJ7gjqe5Ar795WKZ
 obJtgxMfhXBRWXq_mFrMxlUeOcefAYG.oi7SB8NVqDg4rpfYGMBATjctuShg88DvKS6M9CksFrwd
 8ZvvlhpIJhvwtbSjODlrjTX98gwaBHWLV_zLJD0S7oXok96W5VDLflA2GMuxn6XMyR71IR.lgyMQ
 Zvy98z63CvjTKwzI6ARq7HoBhxI.Ocruj1rPsD4pilHAt_2m5rNpiXmGU_exzCdf5bVkUnTM81gJ
 nqhdz8DNNacABDJ18hAUiQA1zsNR1BD7f2l_coOcQCtZG0CrNXfxnoPQVseIyFvVR_sfenElswg7
 axoiLwyGL2luTHM3spCx0zKN83sO2B74zVjCzBffoGyV1F_qI3EPomp7QrziQmLvsl7FTp8utxtW
 k1aMMtIjOnw.EWV.I4JyciCsgc3ow_8l0MaLtuvw6fsxQhxdY2DtsJFE3F0ty6OC6BsFeR5KHK3r
 YwLIO6sdpfHHPG.L6wuio.2TGf6L5PtoNcBi9iYTP97AQ07cEV84sf.mpR0wY1rbGMDFXJBsnyo_
 jqUvxMn85RRGKR60m1MKDy9PVFd5Er7Knf5ygOBrWcoHpl6LK7qXn2CoR0Lp1iZ3xnHs3zRz_.CA
 RdwBI42Cdo1WUpPXJtikck6LzVeXjOchY7VejWUiGy1nepAxuURlgxXC2m8_HQGuVIYYZtFf3mvl
 ENmDsmrXzGnpG5jd3gw.FfqD8uhrPg1TVeyyhslkXzcxtZ23EtDo56vJZDC4R5QIomZ6MfjBVM2D
 6SBR0xfY2FcniONY5L0IfuP0ul5V8DrMS9vaJEItxg1KmuZ.WNMcqhnfKnh4Kqfo3jFLRyTfvFFB
 tvQVIGVHNeU_OYSRGikqVL0.SZ2qnOPsTu6wmdRUUH2pwr3EsdFwEFd1it0.ipkFfr6RXCxKTyQY
 whObp07HxVmHcNZnWmPQHnf0IkAxBzpj6OMdCM64n8jOdjSPOhY40n_RFy4B3V8MeE_ufFvoTcCj
 aDkBcI7YiU74y68idaB3eJYti3NmHxz3qFjrdGei1fHp1OzXDI63WJhuXuEyr74TIuJ6884Ob6.4
 tVX1RXSsFlU0LDyPcUhNQU1mah1v9Ag6uyLm19_ZPsvqX0c4TrZtbyhAh8gElebSiXOLg3D6obUH
 5CfrPDZicDtPE3RCteZ1qrA814wL1zwf9NaKTV9R9MnV3xYkhUAmG7fuj9IGNMveEhYHj.a.hWl6
 FigjkUeHtiRs5eTHkwsBfkkJ6uIqwkRg0MWJji1njs4_P0nzc8aAyfaPNHjT0a0RQS376BMIowLo
 i2cuUVSn4ODGUxqhR15LzuosK0fKClOCsaVLM4ch4_oqhGjuDpVRcthHY5r9cptdgSsNtd5RHgBl
 fdey0CmNVR0G8PTyYkBEjqvDVP1asnkPu1E89JCdt.JlTrR0OkiIo3u0au0MvdlAE3jOQgn_b84n
 jCuOzaF7SRJgJnPDCII6_eqVhMYEll9hwzMAOXUrAClt_9xqXwWvPM2xb7RtJP0C8B3KJN4wlK3d
 9Xjp4F4DUaiRmaQiyb7synfTADX157JB_yIUErPRYVSl5y79Ep2kps.2fRJKNPFG5Ma4P1iQzTd6
 BW8KMuwlDavMPg96nGV7r0uVE3KXTS8nGsDpmXGMKQeoBuE0kL5IeGLwY8y74zOCwvZbKRlmyJgy
 Q88YwLlXMQqwzezDYRcnoq5rUAbMmlHTOXWJsX13ofTiefir0LpB_1nAtF_vtlkluY3S1ZHFpSwY
 zGlyR18VZrsOjKFVRpYUoMfJqUQty.brPJ32_xRVc7Km4cV0CXyr8mrGjGXzs2K78jz6_hQMTTsx
 MsdAyhqBI1oXCu8qtuRqPYLk1AJRXMJ42492ROJMhDf.vBL_a2_PxeWcib_knCSJE8Cfr98RnWtk
 n9tJMtw8jE7ZfFfRmmifbnormXcFUarffaPKpRhJ4meSdzmuCPEL9JmxiJX1XwvvrRijGGGxWAoL
 Uz4WiwX7lXg8PLZLCRYN90A4Zpe4TnXW4G4gWpeaPNRzZsNvXmF4y9YlgnpcJltPXrKuNtOMHRS8
 eTze7E3GikjZNmfD4wp4AxpThdISSEh3olfRHjsAEaHnjQ.AAngKvmYKNkLWmn43uwuuiiYEw.be
 LIOLC7X25Sfw1_Zj8CJyf0WQTlMd7REP1GVoHUHFDA6m7u_p70X7aUEp9CiIRrAne6Adl.YFTZY7
 2hlTtOWtAxLaOVNDmXVcb10aGeJLG1m4v6grXTfmwI2efsyJJ7LBEIRbmHMabFbGpiAo_AMqwLBP
 0QdOpXo.ncHLFGxpHrg8zUow4IbrPpS.FNsdpxHax8NgOLa2ND_NjQgGfYoNisPDUqYU19IE0VTn
 G39GdrO5xu3qLxtJ5dgHKAMnbGw2jU8wuLD8NKGiJsXQvgwJU0UlwMQqnB8QJJFlrnmCnFkc.nHX
 ZW6s37IhaBZK7Y8gRcgswyoace0UHXGqlMTeLUhMFs_O5OA2JX1ZwiVsVG2q37CXhQelaKztw.R2
 hY1.hPzu.Rrv0ayhUKGNeN.u4eOVQnOOxAAO.h2uyHfQkVLIVC9IekxRuayItWdFVFnlOqqVhNWC
 4JDat4UC1nj4F6Pi8GKyvvvFyOx8K2qlpaz5ARSt0yFvR9Oc7zaYbnnKv6EM21pfvDFuQDGGT6t.
 fZ7_De4seNrdwYNDb0mazNN9T8hWLieO4RUCfXUoHSG9L6VzT.t9xs8bUh592lEyVgXwowmlM6ps
 IwD8NtUodvU0gNOFP27ZrPdFX6Uwcf3YZknF6wLZUJqDlmG8TjL3SVlcZQTW66vSprTL54FhcGRM
 rHbEkCX1bYih3AO9qzl1IX0MOrP2h1K4k8j293kG1gswu.1Xf3lJM4YShLoBfkuHSM5nx0V9h1Ki
 F9XrBjosdWM12mSP5roXlMkhx7TZ2xbEyHZSum.rU0J.93528i8l34_siK6Dwq3DxgifNxGRRohE
 nJXqU7D6IOsjiLEd4MmYwz2a69nTZYT6vsrgeSsePOUsTwdUb.qAzhhISnqej3s33GarMqNtgzcC
 ZXKnEuURBIfX9_6lkkrRiUufPlrivxXWbcz2L.sidHA8mYZRmpafDo_0_itTsAl7CUNpYLodqOOY
 1qhay12cJvO5dmBbaEs7O4cMeabSCcZt1C7dL9I5abPnAqIJ2wFMT_f22avS0qNm62JTiPCsM_O1
 DTQ.9YFHfPbnMTxFRZZ4XOp3KotvaA_pW4pN2wNDxecNmJj6n4BVOUvJ2MEsCZWBQXMsRdbQmX47
 .F2GC2RhJKyTreOiTloflNdUkB_pcwPR_WF4je56Sk3wYQWEFBZBHTZNFHCBa5lKec5fBRbykgo.
 HXtgY72JMXuBO9ntLHoVL0vULm1pJ2teJI8BHOXXFg6iVpiGSIEm8J9jLjjg9VsKBgvDPLoS9_EP
 cvE9ZwU4keyQnMCspiRVPgJtwi96bjyAeUNF6HBN6yQg5MfdT3zOm3hyHbvgAv9oiarqwESSm1dz
 7FhjWVa2OXHWnG0hPN8oCsDfQV8lfkHUoM8yXXt8P7JSMpcUKg2N0.FCeZ3xBG8l1vFu0R_6YUC7
 kNks19IvQGbCNQqcalfCdtWtGxFSMsr3eFQLQHI925cvwWKwPuO348I_DhoU2g70VYjUx58H9HPG
 uyIX38zHRkDMkt3iqlq28SMGzmynKKOPwdi.MQ9V_EE2z9CZ5AXCdJ6rVEVA8z_jhO3TukKY933i
 iwvsQpC2Hs6mAnlHp3daVfdaPDOyxHWBrIsqKpLNYt7H6yF4m3dhc2Pgf9Vw8BMNk44e76XuwZKX
 5UVYAEjTyMZz1XK6BY73Kp_ctYLdhoBc446eaaYE0WeeE6vh48BEsHGJakihX5PdL9UWh2ZwS0pG
 FzjvVKPKnzD_6e6k9VPauqfQEWEsTccUqv6yXK0OK0VWmStvfZ9ci7w4co2pg95gQjqY8Y8OgxS0
 k0WMioIhVb2FWvLmWo9FVJdfbSgsBPzCWL6mnu2wqsOelsirVuFXqQSRQHLsjoS5SHg8vmcfeq0Y
 m4Rumxoh4y2CagUr.BdKIyBV.hC1YG5VI0bFMZWMl6TmCWpcRUk7_OY3oxcGMmAvTozAWmKu3CGn
 HzZ.LeYCfTNR4m66NPItuRLX2FNPa_Uonk6JQLCl.tiyis7YTJNpVDWD.xcF.0ZEjDEeZzLokqBH
 53vOLYlWoo5fxbDY1Fjb98FrONtVRXwjT57CSK4R8hJOM7GmcQlSuQEqG7CNAdJJOw8yDiPWXytk
 vxvSUQoQ9cAXRui_948khr7efCkvByMQM7mLS06M9IknnefKCsN3WDESro40E_B01qHcFGxOmnnq
 HLh4__w8KLd2iJ5MhKuDdpEmvKx0WX.6sQJTPrg6wiaeRkLUtg5_bB6SRBR5_D5EvcAAEY8YrMp5
 6oPIyX_oiWRl7Q6I2XLBBqyZNWWLeVOWqOcfziKufiimVmAM.5frKCR8azjq4dKoboh8fSmrZ1GN
 AmC0mPBDYRTqyg6ZvSp6ewRqB8hOOqOON09MxvQsj8xfCZCwA4Tbqbn6rzjGXY4DXp4PNjf62s3y
 k2mPUC9MmrVLfuxTGIVYpIKzwmdeJ3QzOcW7Ut2NUhqkw.E0rd7vRM4P10HxcYkGLDrfeQpjn9Ea
 2yx4RGw5OA.mu69BXgXs5xyTzm.v_xcAic1V6cHMKlponrY_KBEqVyuo70.Ke2nZJsol1zTIPoOm
 4hyTIWhcIHv9RwtkC54dMc1YwMeJC2MhJIgcxrXo.qV7OxpxSIzsUBFUGWFycq5nKINiGapTgiRW
 fT53VO2se21kTeaYOkpyI.TUwQWfJAz5iQFqUvzknK5FqAZcZkPT1Nj6hIToN9XHTlkU5SJdP7DE
 2I2r0UKluSr9tVQqny9_RfPI8e2FIjAI96LiIN54nwMdigCitgLzZIwOnGukZD1Z.n6DA_jOgkuN
 SvUx9JNw2ta8MRbP2xNskMv3WGLu8daXDTUztd5Z2QP_0vHJnHqZsOmFT8rooIZOIFUOYYi0RR33
 7Ub.DU2HEmHmsLyJxfBYMv6gy80DP9WE2Q3lq.1D7kTglHBRvZlU878cVkUpnLRga297GIjBmmEb
 rWm97TtRo4oRoyyc.Vx0k5pxfTK9lCRFezShB1VW0Djij9w9bihGgKa7G.ufxMfR6_NNl8I_km6N
 _IXOXWtEyjiAIBJspqhPoeUl3NnSMfNsRa_3d9uGemJpOaBX39Gyj0KhK8o.lD8HMuL3H5w20Oqn
 l26YRHmi2TFoahwA8mxiPp3SeqdLiiZL4DJCIRM_Eu8Qe5VgAQPEDRFle_GWMBkMJ6Dn2RZri_Zd
 P.0ktu9RK6232Wx_nk9aIfIX._IoWhivEbDdbCbYWtR0SR9KEiZcP5lpwY1yZcaKGqZJ9s_bNmq5
 CAC8_54UcC.PoXq82P.h2xKx73x_3LQwO_AQfTTuUzACmFbhynJMyjhigJt7WyIXvaMivQ2uvdsV
 YGOcTeunqyhUt9Adq178XW2XeGsEPFFxBIOar4sJEX_0.A4M3cUITjwWwBTJk9l3HS3Qhj3VX5VB
 IdhJIvLqI.h2lNUH8NAijX6VZ6DJw_om5du9C.9V4BhKct7ZTz0pdaB8PhHbSaIkam9T_zDyRASb
 IMMIepPaG4IHc4hcDMIafxnlpuqRdfVviZKgSPauzfGB23ZYV9kY0F8HzlLbW8jnTLXsFGzxFxSs
 scbMIr63SFgxa.oeFYeGDUMrKY971GBwJOczvlZVWqQyfejK1pY4rmP48nFnkFt.1Q_wPpoT8qCH
 KE05Jm3k4Np51SEMUxMaFv25p_Jgh7Ve3LTwuPhsyVnphokeWkDDrTzT.3fLt4aG10ZiUtC.jQ2T
 Bx1BMdSFS.V7eJ1VfdDu.czxIpcOd9QgWhuK0kjGSFUgbMjk7dO2qj2sQ9hAL0oUSgi31FS8A9do
 7ixFRwJvfdCc6TPhS0a3.vNgTdZ_kdvgmuZ5kBg9dlTxUI63h1f2AFARJ3TfyKA9MPxOEcZCiF.3
 0oNWptVfIzYZOCavBLJtdMYx_rshV2ppBclI2FNt4zskg4aAYgVUMTBOqnSs3tHxx4ULpngKp2VQ
 gRdVZBRORKg0LKVHnbQzTJsMKccfGL4YMtRgHN8pn8Bw7GpESL.KKCNdnvjYvlRkJXiiKn4Y3nYY
 DQXf0fbOs9KKNkNc3RJZdXjCNGGgqkdw_mrCv40arQWjnIpqGMURnUzLw7qJ3YUwYlnO7HnF8zDU
 fkbQbK4ecl1.SQ.8lc28pt4w9LwQfN9Ez2th4O5p8YPO3HdwDTeVegXi2t9L5_JZA_7ZuMHUA11N
 JWK25LRFxDrrfJnySMVFOuW4P564_SxrsuOTYqN8jEKf0w.A55jf8L0HAwAVIaCqBxyuEts6EPLB
 EWj.QVqww4tVHEfVLlBqs5qMAn.Unb1W7bBaDTtebGkA4JvZw8.a5UJeduYfvnaJ0hztWFuoQrvB
 QFm9ANQXjdKw9.Fz15rojv2Mse2rlwV3fPzlAi5TPqO6ZRJa48LLGXfgcmJcryR.5R980wQQWyMH
 Awa7U7sg38seW6Cl8ADyAipvmyjjI0jrljkoibO71
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Wed, 27 Jan 2021 19:39:51 +0000
Date: Wed, 27 Jan 2021 19:39:50 +0000 (UTC)
From: "Mrs. Elizabeth Hunter" <elizabeth5884@yahoo.com>
Message-ID: <403613161.962318.1611776390369@mail.yahoo.com>
Subject: GREETINGS FROM MY HOSPITAL BED( NOT JUNK)
MIME-Version: 1.0
References: <403613161.962318.1611776390369.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17642 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:84.0) Gecko/20100101 Firefox/84.0
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
Reply-To: "Mrs. Elizabeth Hunter" <elizabethmiles010@gmail.com>
Content-Type: multipart/mixed; boundary="===============0827667663=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0827667663==
Content-Type: multipart/alternative; 
	boundary="----=_Part_962317_1618883678.1611776390368"

------=_Part_962317_1618883678.1611776390368
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dearest=C2=A0 Friend,

Greetings, please let this not sound strange to you. My only surviving lawy=
er who would have done this for me died recently .

I prayed and got your email address from a guestbook. My names are Elizabet=
h Hunter from AUSTRALIA, I am 55 years old, I am suffering from a long-time=
 cancer of the lungs which also affected my brain, from all indication my c=
onditions are really deteriorating and it is quite obvious that, according =
to my doctors they have advised me that I may not live for the next One Yea=
r and this is because the cancer stage has gotten to a very bad stage. I wa=
s brought up from a motherless baby's home and was married to my late husba=
nd for seven years without a child, I and my husband moved down to United S=
tates his home country six years ago during the time he got a Government Co=
ntract worth over $100,000,000 and we decided to settle in the country beca=
use of my husband's interest for America. Not long ago my husband died in a=
 fatal motor accident, before his death we were true believers. Since his d=
eath I decided not to re-marry, I sold all my inherited belongings and depo=
sited all the sum of Ten Million US Dollars with a Bank.

Presently, this money is still with them and the management just wrote me a=
s the true owner to come forward to receive the money and the valuables for=
 keeping it so long or rather issue a letter of authorization to somebody t=
o receive it on my behalf since I cannot come over because of my illness or=
 they get it confiscated. Presently, I'm with my laptop in a hospital here =
in London where I have been undergoing treatment for cancer of the lung. It=
 is my wish to see that this money is used for investment purposes in any p=
rofitable business venture and also, I would want 10% of the total Fund rel=
eased to Charity Organization and for the less privileged .


Please assure me that you will act accordingly as I stated herein. Hoping t=
o hear from you soon. Please do respond to my private email only at elizabe=
thmiles010@gmail.com.

Waiting for your reply
Thanks
Mrs. Elizabeth Hunter

------=_Part_962317_1618883678.1611776390368
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false"><div>Dearest&nbsp; Friend,<br><br>Greetings,=
 please let this not sound strange to you. My only surviving lawyer who wou=
ld have done this for me died recently .<br><br>I prayed and got your email=
 address from a guestbook. My names are Elizabeth Hunter from AUSTRALIA, I =
am 55 years old, I am suffering from a long-time cancer of the lungs which =
also affected my brain, from all indication my conditions are really deteri=
orating and it is quite obvious that, according to my doctors they have adv=
ised me that I may not live for the next One Year and this is because the c=
ancer stage has gotten to a very bad stage. I was brought up from a motherl=
ess baby's home and was married to my late husband for seven years without =
a child, I and my husband moved down to United States his home country six =
years ago during the time he got a Government Contract worth over $100,000,=
000 and we decided to settle in the country because of my husband's interes=
t for America. Not long ago my husband died in a fatal motor accident, befo=
re his death we were true believers. Since his death I decided not to re-ma=
rry, I sold all my inherited belongings and deposited all the sum of Ten Mi=
llion US Dollars with a Bank.<br><br>Presently, this money is still with th=
em and the management just wrote me as the true owner to come forward to re=
ceive the money and the valuables for keeping it so long or rather issue a =
letter of authorization to somebody to receive it on my behalf since I cann=
ot come over because of my illness or they get it confiscated. Presently, I=
'm with my laptop in a hospital here in London where I have been undergoing=
 treatment for cancer of the lung. It is my wish to see that this money is =
used for investment purposes in any profitable business venture and also, I=
 would want 10% of the total Fund released to Charity Organization and for =
the less privileged .<br><br><br>Please assure me that you will act accordi=
ngly as I stated herein. Hoping to hear from you soon. Please do respond to=
 my private email only at elizabethmiles010@gmail.com.<br><br>Waiting for y=
our reply<br>Thanks<br>Mrs. Elizabeth Hunter</div><div><br></div></div></di=
v></body></html>
------=_Part_962317_1618883678.1611776390368--

--===============0827667663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0827667663==--
